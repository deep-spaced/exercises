defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.split("", trim: true)
    |> count
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
    |> String.replace(~r/([0-9]*)([A-Z])/, "\\1-\\2 ")
    |> String.split(" ", trim: true)
    |> Enum.map(fn(str) -> String.split(str, "-") end)
    |> generate
  end

  defp count([]), do: ""
  defp count([head|tail]), do: count(tail, head, 1, "")
  defp count([head|tail], current, count, string) when head == current, do: count(tail, current, count+1, string)
  defp count([head|tail], current, count, string), do: count(tail, head, 1, string <> Integer.to_string(count) <> current)
  defp count([], current, count, string), do: string <> Integer.to_string(count) <> current

  defp generate([[num, letter]|tail]), do: generate(tail, "" <> String.duplicate(letter, String.to_integer(num)))
  defp generate([[num, letter]|tail], string), do: generate(tail, string <> String.duplicate(letter, String.to_integer(num)))
  defp generate([], string), do: string
end
