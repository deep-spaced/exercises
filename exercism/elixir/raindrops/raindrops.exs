defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    number
    |> translate
    |> respond(number)
  end

  defp translate(number) do
    convert(number, [3, 5, 7])
  end

  defp convert(_, []), do: ""
  defp convert(number, [x | tail]) when rem(number, x) == 0, do: raindrop(x) <> convert(number, tail)
  defp convert(number, [_ | tail]), do: convert(number, tail)

  defp raindrop(3), do: "Pling"
  defp raindrop(5), do: "Plang"
  defp raindrop(7), do: "Plong"

  defp respond(raindrops, _) when byte_size(raindrops) > 0, do: raindrops
  defp respond(_, number), do: Integer.to_string(number)
end
