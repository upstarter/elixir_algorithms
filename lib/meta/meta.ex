# Dynamic dispatch
# The hack is name of a function should be an atom instead of binary.

defmacro gen_function(fun_name) do
  quote do
    def unquote(:"#{fun_name}")() do
      # your code...
    end
  end
end

__MODULE__.__info__()

@after_compile __MODULE__
def __before_compile__(env)
def __after_compile__(env, _bytecode)
# invoked on `use`
def __using__(opts)

@on_definition {__MODULE__, :on_def}
def on_def(_env, kind, name, args, guards, body)

@on_load :load_check
def load_check
