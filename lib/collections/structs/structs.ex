# Not Null implementation in Structs
# This is much like adding a not null constraint to the structs. When you try to define the struct with the absence of that key in the struct, it should raise an exception. Lets do that…
# You have to use @enforce_keys [<keys>] while defining the struct…

# Defining struct
defmodule Employee do
  @enforce_keys [:salary]
  defstruct name: nil, salary: nil
end

# Execution
# Error
employee = %Employee{name: "aionlabs"}
employee = %Employee{name: "aionlabs", salary: 12345}
# %Employee{name: "john", salary: 12345}

# We can limit the keys to print while we inspect structs using @derive attribute.

defmodule Address do
  @derive {Inspect, only: [:name, :country]}
  defstruct name: "john",
            street: "2nd lane",
            door_no: "12-3",
            state: "mystate",
            country: "My Country"
end

%Address{}
# Address<country: "My Country", name: "john", ...>

defmodule Student do
  defstruct name: "John", place: "Earth"
end

defimpl Inspect, for: Student do
  def inspect(student, _opts) do
    """
    -----------|---------------------
       Name    :     #{student.name}
    -----------|---------------------
       Place   :     #{student.place}
    -----------|---------------------
    """
  end
end

%Student{}
# -----------|---------------------
#    Name    :     John
# -----------|---------------------
#    Place   :     Earth
# -----------|---------------------
