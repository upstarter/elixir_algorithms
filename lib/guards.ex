defmodule Number.Guards do
  defguard is_three_or_five(number) when number === 3 or number === 5
end

# Usage
import Number.Guards

defmodule Hello do
  def check_favorite_number(num) when is_three_or_five(num) do
    IO.puts("The given #{num} is on of my favourite numbers")
  end

  def check_favorite_number(_num), do: IO.puts("Not my favorite number")
end

# You can also use them inside your code logic as they results boolean value.

import Number.Guards

is_three_or_five(5)
# true

is_three_or_five(3)
# true

is_three_or_five(1)
# false
