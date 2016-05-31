defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> clean
    |> downcase
    |> split
    |> calculate
  end

  defp clean(string), do: String.replace(string, ~r/[^\p{L}0-9-\s]/u, " ")
  defp downcase(string), do: String.downcase(string)
  defp split(string), do: String.split(string, " ", trim: true)

  defp calculate(list), do: calculate(list, %{})
  defp calculate([head | tail], map), do: calculate(tail, Map.update(map, head, 1, &(&1 + 1)))
  defp calculate([], map), do: map
end
