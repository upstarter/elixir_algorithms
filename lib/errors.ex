# how to treat errors as data
defmodule Worker do
  def work(n) do
    if :rand.uniform(10) == 1 do
      raise "Ooops!"
    else
      {:result, :rand.uniform(n * 100)}
    end
  end

  def make_work_safe(dangerous_work, arg) do
    try do
      apply(dangerous_work, [arg])
    rescue
      error ->
        # include any needed context here
        {:error, error, arg}
    end
  end

  # will iterate on our work forever making the work function safe
  def stream_work do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.map(fn i -> make_work_safe(&work/1, i) end)
  end
end

IO.puts("Report partion success:")

Worker.stream_work()
|> Enum.take(10)
|> IO.inspect()

IO.puts("Halt on Error with context:")

Worker.stream_work()
|> Enum.reduce_while([], fn
  {:error, _error, _context} = error, _results ->
    {:halt, error}

  result, results ->
    {:cont, [result | results]}
end)
|> case do
  {:error, _error, _context} = error ->
    error

  results ->
    Enum.reverse(results)
end
|> IO.inspect()

# general errors
# Define Custom Error
defmodule BugError do
  # message is the default
  defexception message: "BUG BUG .."
end

# Usage

iex(bug_error.ex)

raise BugError
# ** (BugError) BUG BUG ..
# here passing the message dynamic
raise BugError, message: "I am Bug.."
# ** (BugError) I am Bug..

try do
  throw(:hello)
catch
  message -> "Got #{message}."
after
  IO.puts("I'm the after clause.")
end
