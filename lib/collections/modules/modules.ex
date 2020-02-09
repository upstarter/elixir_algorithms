# This identifier is equivalent to an atom prefixed by Elixir. So in the defmodule Blackode example Blackode is equivalent to :"Elixir.Blackode"

# When we use String.to_atom "Blackode" it converts it into :Blackode But actually we need something like “Blackode” to Blackode. To do that we need to use Module.concat

String.to_atom("Blackode")
# :Blackode
Modul

# Sometimes, we have to make sure that certain module is loaded before making a call to the function. We are supposed to ensure the module is loaded.
Code.ensure_loaded?(:kernel)
# true
Code.ensure_loaded(:kernel)
# {:module, :kernel}
# Similarly we are having ensure_compile to check whether the module is compiled or not…

# Executing code Immediately after loading a Module
# Elixir provides @on_load which accepts atom as function name in the same module or a tuple with function_name and its arity like {function_name, 0}.

# Hello module
defmodule Hello do
  # this executes after module gets loaded
  @on_load :onload
  def onload do
    IO.puts("#{__MODULE__} is loaded successfully")
  end
end

# Execution .... Just copy and paste the code in the iex terminal
# You will see the output something like this ....
# Elixir.Hello is loaded successfully
# {:module, Hello,
#  <<70, 79, 82, 49, 0, 0, 4, 72, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 0, 130,
#    0, 0, 0, 12, 12, 69, 108, 105, 120, 105, 114, 46, 72, 101, 108, 108, 111, 8,
#    95, 95, 105, 110, 102, 111, 95, 95, 9, ...>>, {:onload, 0}}

# mix xref callers Module.function

# mix xref callers Poison.decode
# Prints all callers of the given CALLEE, which can be one of: Module, Module.function, or Module.function/arity.

# Examples:
# mix xref callers ***Module***
# mix xref callers ***Module.fun***
# mix xref callers ***Module.fun/3***
