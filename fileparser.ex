defmodule FileParser do
  def lines_lengths!(path) do
    path
    |> File.stream!()
    |> Stream.map(&String.length(&1))
    |> Enum.to_list()
  end

  def longest_line_length!(path) do
    path
    |> File.stream!()
    |> Stream.map(&String.length(&1))
    |> Enum.max()
  end

  def longest_line!(path) do
    path
    |> File.stream!()
    |> Stream.map(fn line -> {String.length(line), line} end)
    |> Enum.max_by(fn {key, _} -> key end)
    |> elem(1)
  end

  def words_per_line!(path) do
    path
    |> File.stream!()
    |> Stream.map(fn line -> length(String.split(line)) end)
    |> Enum.to_list()
  end
end
