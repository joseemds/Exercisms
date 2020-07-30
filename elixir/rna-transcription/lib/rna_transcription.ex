defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> transform([])
  end

  defp transform([head | tail], rna) do
    rna = [convert_char(head) | transform(tail, rna)]
  end

  defp transform([], rna), do: rna

  @spec convert_char(integer) :: integer | tuple
  def convert_char(char) do
    case char do
      ?A ->
        ?U

      ?C ->
        ?G

      ?T ->
        ?A

      ?G ->
        ?C

      _ ->
        {:error, "Invalid Char"}
    end
  end
end
