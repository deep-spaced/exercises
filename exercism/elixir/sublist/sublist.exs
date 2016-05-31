require IEx

defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b             -> :equal
      is_sublist(a, b)    -> :sublist
      is_superlist(a, b)  -> :superlist
      true                -> :unequal
    end
  end

  defp is_sublist([], b), do: true
  defp is_sublist(a, b), do: check_sublist(a, b, length(a))

  defp is_superlist(a, []), do: true
  defp is_superlist(a,b), do: check_sublist(b, a, length(b))

  defp check_sublist(sublist, superlist, sublist_length) do
    superlist_sliced = Enum.slice(superlist, 0, sublist_length)
    cond do
      superlist_sliced === sublist  -> true
      superlist_sliced == superlist -> false
      superlist_sliced == []        -> false
      true -> check_sublist(sublist, Enum.drop(superlist, 1), sublist_length)
    end
  end
end
