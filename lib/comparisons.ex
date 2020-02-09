# In Elixir every term can compare with every other term. So one has to be careful in comparisons.

x = "I am x "
# "I am x "
x > 34
# true
x > [1, 2, 3]
# true
[1, 2, 3] < 1_234_567_890
# false

# order of comparisons
# number < atom < reference < fun < port < pid < tuple < map < list < bitstring (binary)
