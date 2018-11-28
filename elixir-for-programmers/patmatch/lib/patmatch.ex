defmodule Patmatch do
  @moduledoc """
  Documentation for Patmatch.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Patmatch.hello()
      :world

  """
  def hello do
    :world
  end

  def swap({a, b}), do: {b, a}

  def equals(a, a), do: true
  def equals(_, _), do: false
end
