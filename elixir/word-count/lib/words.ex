defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    {:ok, reg} = Regex.compile("[!-,\.-/:-@\[-^`{-~]")
    String.downcase(sentence)
    |> String.replace(reg, "")
    |> String.replace(~r/_/," ")
    |> String.split
    |> loop(%{})
  end

  defp loop sent, post do
    case sent do
      [head | tail] -> loop(tail, Map.update(post, head, 1, &(&1 + 1)))
      [] -> post
    end
  end
end
