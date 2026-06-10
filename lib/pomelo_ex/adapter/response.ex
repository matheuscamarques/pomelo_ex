defmodule PomeloEx.Adapter.Response do
  @moduledoc false
  defstruct [:status, :body, :headers]

  @type t :: %__MODULE__{
          status: pos_integer(),
          body: String.t(),
          headers: list({String.t(), String.t()})
        }
end
