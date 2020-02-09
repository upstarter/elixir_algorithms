# Keyword Lists
for {_key, val} <- [one: 1, two: 2, three: 3], do: val
# [1, 2, 3]

# Maps
for {k, v} <- %{"a" => "A", "b" => "B"}, do: {k, v}
# [{"a", "A"}, {"b", "B"}]

# Binaries
for <<c <- "hello">>, do: <<c>>
# ["h", "e", "l", "l", "o"]

# It’s possible to use multiple generators, much like nested loops:
list = [1, 2, 3, 4]

for n <- list, times <- 1..n do
  String.duplicate("*", times)
end

# ["*", "*", "**", "*", "**", "***", "*", "**", "***", "****"]

# To better illustrate the looping that is occurring, let’s use IO.puts to display
# the two generated values:

for n <- list, times <- 1..n, do: IO.puts("#{n} - #{times}")
# 1 - 1
# 2 - 1
# 2 - 2
# 3 - 1
# 3 - 2
# 3 - 3
# 4 - 1
# 4 - 2
# 4 - 3
# 4 - 4

# Filters  You can think of filters as a sort of guard for comprehensions. When a
# filtered value returns false or nil it is excluded from the final list. Let’s
# loop over a range and only worry about even numbers. We’ll use the is_even/1
# function from the Integer module to check if a value is even or not.
import Integer
for x <- 1..10, is_even(x), do: x([2, 4, 6, 8, 10])

# Like generators, we can use multiple filters. Let’s expand our range and then filter
# only for values that are both even and evenly divisible by 3.
import Integer
for x <- 1..100, is_even(x), rem(x, 3) == 0, do: x
# [6, 12, 18, 24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84, 90, 96]
#
# Using :into  What if we want to produce something other than a list? Given the
# :into option we can do just that! As a general rule of thumb, :into accepts any
# structure that implements the Collectable protocol.
#
# Using :into, let’s create a map from a keyword list:
for {k, v} <- [one: 1, two: 2, three: 3], into: %{}, do: {k, v}
# %{one: 1, three: 3, two: 2}

# Since binaries are collectables we can use list comprehensions and :into to create strings:
for c <- [72, 101, 108, 108, 111], into: "", do: <<c>>
# "Hello"

for dir <- dirs,
    # nested comprehension
    file <- File.ls!(dir),
    # invoked
    path = Path.join(dir, file),
    # condition
    File.regular?(path) do
  IO.puts(file)
end
