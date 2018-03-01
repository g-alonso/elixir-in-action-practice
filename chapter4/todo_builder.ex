defmodule TodoList.CsvImporter do
  def import (path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(&String.split(&1, ","))
    |> Stream.map( fn [a, b] -> %{date: a, entry: b}  end )
    |> Enum.to_list
    |> TodoList.new
  end
end

defmodule TodoList do

  defstruct auto_id: 1, entries: HashDict.new

  def add_entry(
    %TodoList{entries: entries, auto_id: auto_id} = todo_list, entry
  ) do
    entry = Map.put(entry, :id, auto_id)
    new_entries = HashDict.put(entries, auto_id, entry)
    # %TodoList es el acceso a la struct
    %TodoList{ todo_list | entries: new_entries, auto_id: auto_id + 1 }
  end

  def new(entries \\ []) do
    Enum.reduce(
      entries,
      %TodoList{},
      fn(entry, todo_list_acc) ->
        add_entry(todo_list_acc, entry)
      end
      )
    end
end
