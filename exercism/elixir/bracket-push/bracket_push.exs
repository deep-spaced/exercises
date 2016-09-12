defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    # Count the opening brackets
    opening_count = String.split(str)
      |> Enum.count(chr_matches)
    # Count the closing brackets
    # Return appropriately
  end
end
