defmodule Bob do
  def hey(input) do
    cond do
      String.equivalent?("", String.trim(input)) ->
        "Fine. Be that way!"

      String.equivalent?(input, String.upcase(input)) &&
        String.equivalent?(input, String.downcase(input)) && String.ends_with?(input, "?") ->
        "Sure."

      String.equivalent?(input, String.upcase(input)) &&
          String.equivalent?(input, String.downcase(input)) ->
        "Whatever."

      String.ends_with?(input, "?") && String.equivalent?(input, String.upcase(input)) ->
        "Calm down, I know what I'm doing!"

      String.equivalent?(input, String.upcase(input)) ->
        "Whoa, chill out!"

      String.trim(input) |> String.ends_with?("?") ->
        "Sure."

      true ->
        "Whatever."
    end
  end
end
