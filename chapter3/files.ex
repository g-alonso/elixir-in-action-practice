# Practices

# Using large_lines!/1 as a model, write the following function:

defmodule Files do

  # lines_lengths!/1 that takes a file path and returns a list of numbers, with each
  # number representing the length of the corresponding line from the file.
  def lines_lengths(path) do
    File.stream!(path)
    |> Stream.map(&(String.length(&1)))
    |> Enum.to_list
  end

  #longest_line_length!/1 that returns the length of the longest line in a file.
  def longest_line_length(path) do
    File.stream!(path)
    |> Stream.map(&String.length/1)
    |> Enum.reduce(
      &max/2
      )
  end

  #longest_line!/1 that returns the contents of the longest line in a file.
  def longest_line!(path) do
    File.stream!(path)
    |> Enum.reduce(
      "",
      &longer/2
      )
      #|> (&(String.length(&1))).()
  end
  defp longer(line1, line2) do
    if String.length(line1) > String.length(line2) do
      line1
    else
      line2
    end
  end

  #words_per_line!/1 that returns a list of numbers, with each number represent-
  #ing the word count in a file. Hint: to get the word count of a line, use
  #length(String.split(line))
  # Comment: I prefer to return the total value
  def words_per_line!(path) do
    File.stream!(path)
    |> Stream.map(&String.split/1)
    |> Enum.map(&length/1)
    |> Enum.sum
  end

end
