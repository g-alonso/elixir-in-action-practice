# Practices

# positive/1 function that takes a list and returns another list that contains only
# positive numbers from the input list

defmodule Mpositive do

  def positive([])  do
    []
  end

  def positive([head | tail ]) when head > 0 do
    [head | positive(tail)]
  end

  def positive([_ | tail ]) do
    positive(tail);
  end

end
