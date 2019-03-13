File.stream!("path/to/some/file")
|> Flow.from_enumerable()
|> Flow.flat_map(&String.split(&1, " "))
|> Flow.partition()
|> Flow.reduce(fn -> %{} end, fn word, acc ->
  Map.update(acc, word, 1, &(&1 + 1))
end)
|> Enum.to_list()

## Optimized ##

# The parent process which will own the table
parent = self()

# Let's compile common patterns for performance
# BINARY
empty_space = :binary.compile_pattern(" ")

# READ_AHEAD
File.stream!("path/to/some/file", read_ahead: 100_000)
|> Flow.from_enumerable()
# BINARY
|> Flow.flat_map(&String.split(&1, empty_space))
|> Flow.partition()
# ETS
|> Flow.reduce(fn -> :ets.new(:words, []) end, fn word, ets ->
  :ets.update_counter(ets, word, {2, 1}, {word, 0})
  ets
end)
|> Flow.on_trigger(fn ets ->
  :ets.give_away(ets, parent, [])
  # Emit the ETS
  {[ets], :new_reduce_state_which_wont_be_used}
end)
|> Enum.to_list()
