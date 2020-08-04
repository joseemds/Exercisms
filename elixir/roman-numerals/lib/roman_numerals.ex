defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
  end

  def to_roman(number, roman_string) do
    roman_string <> to_roman(number, roman_string)
  end

  def convert(n) when n >= 1000, do: "M" <> convert(n - 1000)
  def convert(n) when n >= 100, do: "C" <> convert(n - 100)
  def convert(n) when n >= 50, do: "L" <> convert(n - 50)
  def convert(n) when n >= 10, do: "X" <> convert(n - 10)
  def convert(n) when n >= 5, do: "V" <> convert(n - 5)
  def convert(n) when n >= 1, do: "I" <> convert(n - 1)
  def convert(_), do: ""
end
