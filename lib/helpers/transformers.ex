defmodule AdventOfCode.Helpers.Transformers do
  def lines(raw_input) do
    raw_input
    |> String.split("\n")
    |> Enum.reject(&(&1 == ""))
  end
end
