alias AdventOfCode.Helpers.Transformers

import AOC

aoc 2024, 1 do
  @moduledoc """
  https://adventofcode.com/2024/day/1
  """

  @doc """
      Calculate the total distances between two lists
  """
  def p1(input) do
    input
    |> Transformers.lines()
    |> separate_entries_to_lists()
    |> sort_lists()
    |> reduce_pairs_to_differences()
    |> Enum.sum()
  end

  @doc """
      Calculate the frequencies of the first list in the second list
  """
  def p2(input) do
    input
    |> Transformers.lines()
    |> separate_entries_to_lists()
    |> calculate_frequencies()
  end

  defp separate_entries_to_lists(unseparated_pairs) do
    Enum.reduce(unseparated_pairs, [[], []], fn pair, [first_list, second_list] ->
      [first_number, second_number] = format_pair_to_integer_list(pair)

      first_list = [first_number | first_list]
      second_list = [second_number | second_list]

      [first_list, second_list]
    end)
  end

  defp format_pair_to_integer_list(pair_string) do
    pair_string
    |> String.split("   ")
    |> convert_to_integers()
  end

  defp convert_to_integers([first_num, second_num]) do
    [String.to_integer(first_num), String.to_integer(second_num)]
  end

  # Sorting formatted integer lists to ascending order
  defp sort_lists([first_list, second_list]) do
    [Enum.sort(first_list), Enum.sort(second_list)]
  end

  # Reduce down to one list
  defp reduce_pairs_to_differences(pair_lists) do
    Enum.zip_reduce(pair_lists, [], fn [first_num, second_num], acc ->
      difference = abs(second_num - first_num)

      [difference | acc]
    end)
  end

  defp calculate_frequencies([first_list, second_list]) do
    frequency_list = Enum.frequencies(second_list)

    for x <- first_list, reduce: 0 do
      acc -> acc + x * Map.get(frequency_list, x, 0)
    end
  end
end
