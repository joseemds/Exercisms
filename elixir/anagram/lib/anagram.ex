defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(candidates, fn x -> String.upcase(x) != String.upcase(base) end)
    |> Enum.filter(&compare(base, &1))
  end

  defp compare(base, word) do
    word
    |> String.upcase()
    |> String.graphemes()
    |> Enum.sort() ==
      base
      |> String.upcase()
      |> String.graphemes()
      |> Enum.sort()
  end

  def compare(_), do: false
end
