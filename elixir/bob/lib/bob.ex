defmodule Bob do
  def hey(input) do
    cond do
      String.equivalent?("", String.trim(input)) ->
        "Fine. Be that way!"

      String.match?(input, ~r/^[^a-z]*$/) && String.match?(input, ~r/[?]$/) ->
        "Calm down, I know what I'm doing!"

      String.trim(input) |> String.ends_with?("?") ->
        "Sure."

      String.match?(input, ~r/^[^a-z]*$/) ->
        "Whoa, chill out!"

      true ->
        "Whatever."
    end
  end
end
