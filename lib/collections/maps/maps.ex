# details = %{name: "john", address1: "heaven", mobile1: "999999999"}
# The above map comprises of two weird keys address1 and mobile1 where we do workout on to take over them.

details = %{name: "john", address1: "heaven", mobile1: "999999999"}
# %{address1: "heaven", mobile1: "999999999", name: "john"}

Map.new(details, fn
  {:address1, address} -> {:address, address}
  {:mobile1, mobile} -> {:phone, mobile}
  x -> x
end)

# output
%{address: "heaven", name: "john", phone: "999999999"}

# An interesting property of maps is that they provide their own syntax for
# updates (note: this creates a new map):
map = %{foo: "bar", hello: "world"}
# %{foo: "bar", hello: "world"}
%{map | foo: "baz"}
# %{foo: "baz", hello: "world"}
# Note: this syntax only works for updating a key that already exists in the map! If the key does not exist, a KeyError will be raised.

# To create a new key, instead use Map.put/3

map = %{hello: "world"}
# %{hello: "world"}
%{map | foo: "baz"}
# ** (KeyError) key :foo not found in: %{hello: "world"}
#     (stdlib) :maps.update(:foo, "baz", %{hello: "world"})
#     (stdlib) erl_eval.erl:259: anonymous fn/2 in :erl_eval.expr/5
#     (stdlib) lists.erl:1263: :lists.foldl/3

Map.put(map, :foo, "baz")
# %{foo: "baz", hello: "world"}
