date = {2023, 3, 12}
entry = %{date: date, title: "Code"}

todo_list = TodoList.new
todo_list = TodoList.add_entry(todo_list, entry)

date = {2023, 3, 12}
entry = %{date: date, title: "Gym"}
todo_list = TodoList.add_entry(todo_list, entry)

date2 = {2023, 3, 13}
entry = %{date: date2, title: "Code"}
todo_list = TodoList.add_entry(todo_list, entry)

IO.inspect(TodoList.entries(todo_list, date))
