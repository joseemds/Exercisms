defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """

  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.split()
    |> Enum.reduce(%{}, fn word, acc -> Map.put(acc, word, 1) end)
  end
end
