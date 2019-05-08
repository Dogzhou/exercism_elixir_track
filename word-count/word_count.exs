defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split(~R/[^[:alnum:]\-]/u, trim: true)
    |> Enum.reduce(%{}, fn word, word_count ->
      Map.update(word_count, word, 1, &(&1 + 1))
    end)
  end
end
