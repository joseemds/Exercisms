defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    convert(number)
  end

  defp convert(n) when n >= 1000, do: "M" <> convert(n - 1000)
  defp convert(n) when n >= 900, do: "CM" <> convert(n - 900)
  defp convert(n) when n >= 500, do: "D" <> convert(n - 500)
  defp convert(n) when n >= 400, do: "CD" <> convert(n - 400)
  defp convert(n) when n >= 100, do: "C" <> convert(n - 100)
  defp convert(n) when n >= 90, do: "XC" <> convert(n - 90)
  defp convert(n) when n >= 50, do: "L" <> convert(n - 50)
  defp convert(n) when n >= 40, do: "XL" <> convert(n - 40)
  defp convert(n) when n >= 10, do: "X" <> convert(n - 10)
  defp convert(n) when n >= 9, do: "IX" <> convert(n - 9)
  defp convert(n) when n >= 5, do: "V" <> convert(n - 5)
  defp convert(n) when n >= 4, do: "IV" <> convert(n - 4)
  defp convert(n) when n >= 1, do: "I" <> convert(n - 1)
  defp convert(_), do: ""
end
