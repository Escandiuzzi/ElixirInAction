# date = {2023, 3, 12}
# entry = %{date: date, title: "Code"}

# todo_list = TodoList.new
# todo_list = TodoList.add_entry(todo_list, entry)

# date = {2023, 3, 12}
# entry = %{date: date, title: "Gym"}
# todo_list = TodoList.add_entry(todo_list, entry)

# date2 = {2023, 3, 13}
# entry = %{date: date2, title: "Code"}
# todo_list = TodoList.add_entry(todo_list, entry)

# IO.puts("Initial")
# IO.inspect(TodoList.entries(todo_list, date))

# IO.puts("After update")
# todo_list = TodoList.update_entry(todo_list, 2, &Map.put(&1, :title, "Study"))
# IO.inspect(TodoList.entries(todo_list, date))

# todo_list = TodoList.delete_entry(todo_list, 2);

# IO.puts("After delete")
# IO.inspect(TodoList.entries(todo_list, date))


IO.inspect(TodoList.CsvImporter.import!("./resources/todos.csv"))
