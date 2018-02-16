# Practices

# range/2 function that takes two integers: from and to and returns a list of all
# numbers in a given range

defmodule Mrange do

  def range(from, to) when from < to do
    range(from, to, [])
  end

  defp range(from, to, list) when from <= to do
    list = list ++ [from]
    from = from + 1
    range(from, to, list)
  end

  defp range(from, to, list) when from > to do
    list
  end

end
