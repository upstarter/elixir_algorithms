list = [3.14, :pie, "Apple"]
[3.14, :pie, "Apple"]
# Prepending (fast)
["π" | list]
["π", 3.14, :pie, "Apple"]
# Appending (slow)
list ++ ["Cherry"]
[3.14, :pie, "Apple", "Cherry"]

# List Concatenation
[1, 2] ++ [3, 4, 1]

# List Subtraction
["foo", :bar, 42] -- [42, "bar"]
# ["foo", :bar]

# hd , tl
hd([3.14, :pie, "Apple"])
# 3.14
tl([3.14, :pie, "Apple"])
# [:pie, "Apple"]

# In addition to the aforementioned functions, you can use pattern matching and
# the cons operator | to split a list into head and tail. We’ll learn more about
# this pattern in later lessons:
[head | tail] = [3.14, :pie, "Apple"]
# [3.14, :pie, "Apple"]
head
# 3.14
tail
# [:pie, "Apple"]
