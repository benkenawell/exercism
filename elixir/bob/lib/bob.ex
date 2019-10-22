defmodule Bob do
  def hey(input) do
    cond do
      checkSilence(input) -> "Fine. Be that way!"
      checkShouttedQuestion(input) -> "Calm down, I know what I'm doing!"
      checkQuestion(input) -> "Sure."
      checkYelling(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp checkSilence(input) do
    String.length(String.replace(input, ~r/ +/, "")) <= 0
  end

  defp checkShouttedQuestion(input) do
    replaced = String.replace(input, ~r/[0-9,]+/, "")
    String.ends_with?(input, "?")
      && String.jaro_distance(replaced, String.downcase(replaced)) < 0.75
  end

  defp checkQuestion(input) do
    String.ends_with?(input, "?")
  end

  defp checkYelling(input) do
    replaced = String.replace(input, ~r/[0-9,! ]+/, "")
    String.jaro_distance(replaced, String.downcase(replaced)) < 0.75
  end
end
