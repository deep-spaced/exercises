defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    valid_nucleotide?(nucleotide)

    strand
    |> validate
    |> Enum.count(fn x -> x == nucleotide end)
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(''), do: %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
  def histogram(strand) do
    %{
      ?A => count(strand, ?A),
      ?T => count(strand, ?T),
      ?C => count(strand, ?C),
      ?G => count(strand, ?G),
    }
  end

  def validate(''), do: ''
  def validate(strand) do
    sorted = strand
    |> Enum.uniq
    |> Enum.sort
    |> Enum.map(fn x -> valid_nucleotide?(x) end)
    strand
  end

  def valid_nucleotide?(?A), do: true
  def valid_nucleotide?(?C), do: true
  def valid_nucleotide?(?G), do: true
  def valid_nucleotide?(?T), do: true
  def valid_nucleotide?(_), do: raise ArgumentError, message: "Invalid strand"
end
