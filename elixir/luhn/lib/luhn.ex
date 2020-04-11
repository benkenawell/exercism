require Integer

defmodule Luhn do
  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number), do: number
    |> String.replace(" ", "", global: true)
    |> branch(&valid_input?/1, false, &(0 == luhn_calc(&1)))

  @spec valid_input?(String.t()) :: boolean
  defp valid_input?(x), do: String.length(x) <= 1 or Regex.match?(~r/[^0-9 ]/, x)

  @type element() :: any()
  @type answer() :: any()

  # not quite as generic as Ramda's ifElse function, but I like it in principle.
  # maybe I should be moving on purescript or haskell with this kind of usage though....
  @spec branch(element(), (element() -> boolean), answer(), (element() -> answer())) :: answer()
  defp branch(val, pred, tr, fa), do: if pred.(val), do: tr, else: fa.(val)

  @spec luhn_calc(String.t()) :: integer()
  defp luhn_calc(x), do: x
    |> String.graphemes
    |> Enum.map(&Integer.parse/1)
    |> Enum.map(fn {i, _} -> i end)
    |> Enum.reverse
    |> Enum.with_index(1)
    |> Enum.map(&serial_calculation/1)
    |> Enum.sum
    |> Integer.mod(10)

  @spec serial_calculation({integer(), integer()}) :: integer
  defp serial_calculation({number, index}), do: if Integer.is_even(index), do: even_calculation(number), else: number

  @spec even_calculation(integer()) :: integer()
  defp even_calculation(number), do: case (number * 2), do:
      (x when x > 9 -> x - 9
      x -> x)
end
