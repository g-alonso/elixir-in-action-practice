# Practices

# list_len/1 function that calculates the length of a list

defmodule Mlen do

  def list_len([]), do: 0

  def list_len([head | tail]) do
    1 + list_len(tail)
  end

end
