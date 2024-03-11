defmodule Calculator do
  def list_len(list) do
    calculate_length(0, list)
  end

  defp calculate_length(count, []) do
    count
  end

  defp calculate_length(count, [_ | tail]) do
    # Tail Recursive calculate_length(count + 1, tail)
    # Non-tail Recursive
    1 + calculate_length(count, tail)
  end

  def range(min, max) do
    add_to_range([], min, max)
  end

  defp add_to_range(list, min, max) when min === max do
    list = [max | list]
    list
  end

  defp add_to_range(_, min, max) when min > max do
    []
  end

  defp add_to_range(list, min, max) do
    list = [max | list]
    add_to_range(list, min, max - 1)
  end

  def positive(list) do
    new_list = []
    get_positive_numbers(list, new_list)
  end

  defp get_positive_numbers([], new_list) do
    new_list
  end

  defp get_positive_numbers([head | tail], new_list) when head > 0 do
    new_list = [head | new_list]
    get_positive_numbers(tail, new_list)
  end

  defp get_positive_numbers([head | tail], new_list) when head < 0 do
    get_positive_numbers(tail, new_list)
  end
end
