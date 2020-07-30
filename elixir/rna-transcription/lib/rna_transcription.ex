defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna =
      dna
      |> transform([])
      |> Enum.reverse()
  end

  def transform([head | tail], rna) do
    rna = [convert_char(head) | rna]
    transform(tail, rna)
  end

  def transform([], rna) do
    rna
  end

  @spec convert_char(integer) :: integer | tuple
  def convert_char(char) do
    case char do
      65 ->
        85

      67 ->
        71

      84 ->
        65

      71 ->
        67

      _ ->
        {:error, "Invalid Char"}
    end
  end
end
