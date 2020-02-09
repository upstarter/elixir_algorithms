defmodule Timed do
  def inspect(module, fun, args \\ []) do
    begin = :os.timestamp()
    answer = apply(module, fun, args)
    finish = :os.timestamp()

    IO.inspect("#{module}: #{answer} in #{:timer.now_diff(finish, begin) / 1000}")
  end
end
