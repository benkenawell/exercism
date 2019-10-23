defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    keeploop([], list, fun)
  end

  defp keeploop(acc, list, fun) do
    case list do
      [ head | tail ] -> if fun.(head) do 
        keeploop(acc ++ [head], tail, fun) 
      else keeploop(acc, tail, fun) end
      [] -> acc
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    discardloop([], list, fun)
  end

  defp discardloop(acc, list, fun) do
    case list do
      [ head | tail ] -> unless fun.(head) do 
        discardloop(acc ++ [head], tail, fun) 
      else discardloop(acc, tail, fun) end
      [] -> acc
    end
  end
end
