require Integer

defmodule Luhn do
  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    stripped = number
      |> String.replace(" ", "", global: true)
    if String.length(stripped) <= 1 or Regex.match?(~r/[^0-9 ]/, stripped) do
      false
    else
      stripped
      |> String.graphemes
      |> Enum.map(&Integer.parse/1)
      |> Enum.map(fn {i, _} -> i end)
      |> Enum.reverse
      |> Enum.with_index(1)
      |> Enum.map(fn {number, index} -> if Integer.is_even(index), do: even_calculation(number), else: number end)
      |> Enum.sum
      |> div_by_10?
    end
  end

  @spec even_calculation(integer()) :: integer()
  defp even_calculation(number) do 
    doubled = number * 2
    if doubled > 9, do: doubled - 9, else: doubled
  #   case (number * 2) do
  #     x when x > 9 -> x - 9
  #     x -> x
  #   end
  end

  @spec div_by_10?(integer()) :: boolean
  defp div_by_10?(number) do
    Integer.mod(number, 10) == 0
  end
end
