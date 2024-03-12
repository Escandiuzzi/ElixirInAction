defmodule TodoList do
  defstruct auto_id: 1, entries: Map.new()

  def new(entries \\ []) do
    entries
    # fn entry, todo_list_acc -> add_entry(todo_list_acc, entry) end)
    |> Enum.reduce(%TodoList{}, &add_entry(&2, &1))
  end

  # def new, do: %TodoList{}

  def add_entry(%TodoList{entries: entries, auto_id: auto_id} = todo_list, entry) do
    entry = Map.put(entry, :id, auto_id)
    new_entries = Map.put(entries, auto_id, entry)

    %TodoList{
      todo_list
      | entries: new_entries,
        auto_id: auto_id + 1
    }
  end

  def entries(%TodoList{entries: entries}, date) do
    entries
    |> Stream.filter(fn {_, entry} -> entry.date == date end)
    |> Enum.map(fn {_, entry} -> entry end)
  end

  def update_entry(todo_list, %{} = new_entry) do
    update_entry(todo_list, new_entry.id, fn _ -> new_entry end)
  end

  def update_entry(%TodoList{entries: entries} = todo_list, entry_id, updated_func) do
    case entries[entry_id] do
      nil ->
        todo_list

      old_entry ->
        old_entry_id = old_entry.id

        new_entry = %{id: ^old_entry_id} = updated_func.(old_entry)
        new_entries = Map.put(entries, entry_id, new_entry)

        %TodoList{
          todo_list
          | entries: new_entries
        }
    end
  end

  def delete_entry(%TodoList{entries: entries, auto_id: auto_id} = todo_list, delete_id)
      when is_number(delete_id) do
    new_entries = Map.delete(entries, delete_id)

    %TodoList{
      todo_list
      | entries: new_entries,
        auto_id: auto_id - 1
    }
  end
end

defmodule CsvImporter do
  def import!(path) do
    path
    |> File.stream!()
    |> Enum.map(&parse_line(&1))
    |> TodoList.new
  end

  defp parse_line(line) do
    line = String.replace(line, "\n", "")

    [date_string, title] = String.split(line, ",")
    [year_string, month_string, day_string] = String.split(date_string, "/")

    %{
      date:
        {String.to_integer(year_string), String.to_integer(month_string),
         String.to_integer(day_string)},
      title: title
    }
  end
end
