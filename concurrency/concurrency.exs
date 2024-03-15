run_query = fn query_def ->
  :timer.sleep(2000)
  query_def <> " Result"
end

async_query = fn query_def -> spawn(fn -> IO.puts(run_query.(query_def)) end) end

1..5
|> Enum.map(&async_query.("Query " <> to_string(&1)))


:timer.sleep(4000)
