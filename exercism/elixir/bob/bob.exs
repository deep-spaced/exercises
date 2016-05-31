defmodule Teenager do
  def hey(input) do
    cond do
      silence?(input) ->
        "Fine. Be that way!"
      question?(input) ->
        "Sure."
      shouting?(input) ->
        "Whoa, chill out!"
      true ->
        "Whatever."
    end
  end

  defp shouting?(input), do: String.upcase(input) == input and String.match?(input, ~r/\p{L}/)

  defp question?(input), do: String.ends_with?(input, "?")

  defp silence?(input), do: String.strip(input) == ""
end
