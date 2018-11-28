defmodule Lists do
  @moduledoc """
  Documentation for Lists.
  """

  def len( [] ), do: 0
  def len( [ _head | tail ] ), do: 1 + len(tail)

  def sum( [] ), do: 0
  def sum( [ head | tail ] ), do: head + sum(tail)

  def double( [] ), do: []
  def double( [ head | tail ] ), do: [ head*2 | double(tail) ]

  def square( [] ), do: []
  def square( [ head | tail ] ), do: [ head*head | square(tail) ]

  def sum_pairs( [] ), do: []
  def sum_pairs( [ a1, a2 | tail ] ), do: [ a1+a2 | sum_pairs(tail) ]

  def even_length?( [] ), do: true
  def even_length?( [ _h | [] ] ), do: false
  def even_length?( [ _h1, _h2 | t ] ), do: even_length?(t)

end
