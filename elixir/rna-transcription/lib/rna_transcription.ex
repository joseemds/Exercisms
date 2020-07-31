defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna), do: transform(dna, [])

  defp transform([?A | tail], rna), do: [?U | transform(tail, rna)]
  defp transform([?C | tail], rna), do: [?G | transform(tail, rna)]
  defp transform([?T | tail], rna), do: [?A | transform(tail, rna)]
  defp transform([?G | tail], rna), do: [?C | transform(tail, rna)]
  defp transform([], rna), do: rna
end
