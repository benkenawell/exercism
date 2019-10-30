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
    {handshake, _} = [ "wink", "double blink", "close your eyes", "jump" ] 
    |> Enum.zip(0..3)
    |> Enum.filter(fn {word, idx} -> bsr(code, idx) |> band(1) == 1 end)
    |> Enum.unzip
    if bsr(code, 4) == 1 do 
      Enum.reverse(handshake) 
    else 
      handshake 
    end
  end
end
