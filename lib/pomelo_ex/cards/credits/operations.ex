defmodule PomeloEx.Cards.Credits.Operations do
  @moduledoc """
  This service allows you to query the performed operations.
  """

  alias PomeloEx.Cards.Credits.Operations.GetOperations

  defdelegate get_operations(payload), to: GetOperations, as: :execute
end
