
defmodule TodoList do
  defstruct auto_id: 1, entries: HashDict.new

  def new, do: %TodoList{}

  def add_entry(
    %TodoList{entries: entries, auto_id: auto_id} = todo_list, entry
  ) do
    entry = Map.put(entry, :id, auto_id)
    new_entries = HashDict.put(entries, auto_id, entry)
    # %TodoList es el acceso a la struct
    %TodoList{ todo_list | entries: new_entries, auto_id: auto_id + 1 }
  end

  def entries(%TodoList{entries: entries}, date) do
    entries
    |> Stream.filter(
        fn({_, entry}) ->
          entry.date == date
        end
    )
    |> Enum.map(
        fn({_, entry}) ->
          entry
        end
      )
    end

    def update_entry(
      %TodoList{entries: entries} = todo_list,
      entry_id,
      updater_fun
    ) do
      case entries[entry_id] do
        nil -> todo_list
        old_entry -> new_entry = updater_fun.(old_entry)
          new_entries = HashDict.put(entries, new_entry.id, new_entry)
          %TodoList{todo_list | entries: new_entries}
      end
    end

    def delete_entry(
      %TodoList{entries: entries} = todo_list,
      entry_id
    ) do
      case entries[entry_id] do
        nil -> todo_list
        old_entry ->  altered = HashDict.delete(entries, entry_id)
          %TodoList{ todo_list | entries: altered}
      end
    end
end

# my_todo = TodoList.new
# my_todo = TodoList.add_entry(my_todo, %{"nombre": "Derrida"})
# my_todo = TodoList.add_entry(my_todo, %{"nombre": "Walter Benjamin"})
# my_todo = TodoList.add_entry(my_todo, %{"nombre": "Charles Baudelaire"})

# my_todo = TodoList.update_entry(my_todo, 1, &Map.put(&1, :nombre, "Jackie Derrida"))

# my_todo = TodoList.delete_entry(my_todo, 1)
# my_todo = TodoList.delete_entry(my_todo, 2)
# my_todo = TodoList.delete_entry(my_todo, 3)
