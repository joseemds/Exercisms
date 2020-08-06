defmodule Bob do
  def hey(input) do
    cond do
      String.ends_with?(input, "?") && String.equivalent?(S, String.upcase(input)) ->
        "Calm down, I know what I'm doing!"

      String.equivalent?("", String.trim(input)) ->
        "Fine. Be that way!"

      String.equivalent?(input, String.upcase(input)) ->
        "Whoa, chill out!"

      String.trim(input) |> String.ends_with?("?") ->
        "Sure."

      true ->
        "Whatever."
    end
  end
end
