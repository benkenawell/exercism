use Bitwise, skip_operators: true

defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    [ "wink", "double blink", "close your eyes", "jump" ]
    |> Enum.zip(0..3)
    |> Enum.filter(fn {_, idx} -> bsr(code, idx) |> band(1) == 1 end)
    |> Enum.unzip
    |> cond_reverse(fn {handshake, _} -> handshake end, fn _ -> bsr(code, 4) == 1 end)
  end

  @doc """
  given an array, pass in two functions.  the first, getValue will be called on the first array to determine 
  a) what to use as an argument into the predicate function
  b) what to return (either reversed or straight)
  the second argument will be the predicate function used to determine if the function should reverse the array or not
  """
  defp cond_reverse(arr, getValue, pred) do
    if pred.(getValue.(arr)) do
      Enum.reverse(getValue.(arr))
    else
      getValue.(arr)
    end
  end
end
