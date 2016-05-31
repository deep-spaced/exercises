defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/[\s-]/)
    |> Enum.map_join("", &( String.replace(&1, ~r/(.)[a-z\W]*/, "\\1") ))
    |> String.upcase

  end
end
