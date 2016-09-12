defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    # Split base into list of strings
    # loop through candidates running the same function on each.
    # If it matches, include it in the result.
    base_chars = base |> convert
    base_downcased = base |> String.downcase
    check_candidates(base_downcased, base_chars, candidates, [])
  end

  def check_candidates(base, base_chars, [cand | tail], results) do
    if matches?(base, base_chars, cand), do: results = results ++ [cand]
    check_candidates(base, base_chars, tail, results)
  end
  def check_candidates(_base, _base_chars, [], results), do: results

  def matches?(base, chars, candidate) do
    if base == candidate |> String.downcase do
      false
    else
      chars == candidate |> convert
    end
  end

  def convert(str) do
    str
    |> String.downcase
    |> String.to_char_list
    |> Enum.sort
  end
end
