defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
  end

  def convert(n) when n > 1000, do: "M"
  def convert(n) when n > 100, do: "C"
  def convert(n) when n > 50, do: "L"
  def convert(n) when n > 10, do: "X"
  def convert(n) when n > 5, do: "V"
  def convert(n), do: "I"
end
