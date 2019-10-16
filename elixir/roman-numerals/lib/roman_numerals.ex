defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    toNumerals (Integer.digits(number)), ""
  end

  defp toNumerals numList, numerals do
    case numList do
      [head | tail] -> toNumerals(tail, (numerals <> pickCharSet(head,length(tail))))
      [] -> numerals
    end
  end

  # convert the thousands place
  defp pickCharSet(head, pos) when pos == 3 do
    convertDigit head, "M  "
  end

  # convert the hundreds place
  defp pickCharSet(head, pos) when pos == 2 do
    convertDigit head, "CDM"
  end

  # convert the tens digit
  defp pickCharSet(head, pos) when pos == 1 do
    convertDigit head, "XLC"
  end

  # convert the ones digit
  defp pickCharSet(head, pos) when pos == 0 do
    convertDigit head, "IVX"
  end

  defp repeatNumeral times, digit do
    Enum.reduce(1..times, "", fn _, acc -> acc <> digit end)
  end

  # charset is three roman numeral letters in order from least to biggest value that could be applied to each digit
  defp convertDigit digit, charset do
    [low, med, high] = String.graphemes charset
    case digit do  
      x when x == 0 -> ""
      x when x < 4 -> repeatNumeral(x, low)
      x when x == 4 -> low <> med # "IV"
      x when x == 5 -> med
      x when x > 5 and x <= 8 -> med <> repeatNumeral(x-5, low) # x - 5 many "C"
      x when x == 9 -> low <> high # "IX"
    end
  end
end
