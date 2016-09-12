defmodule Accumulate do
  @doc """
    Given a list and a function, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate([], fn(x) -> x * 2 end)
      []

      iex> Accumulate.accumulate([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]

  """

  @spec accumulate(list, (any -> any)) :: list
  def accumulate([], _fun), do: []

  def accumulate([head | tail], fun) do
    accumulate(tail, fun, [fun.(head)])
  end

  defp accumulate([head | tail], fun, new_list) do
    accumulate(tail, fun, new_list ++ [fun.(head)])
  end

  defp accumulate([], _fun, new_list), do: new_list
end
