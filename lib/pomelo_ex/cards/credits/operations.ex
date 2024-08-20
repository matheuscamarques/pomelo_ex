defmodule PomeloEx.Cards.Credits.Operations do
  @moduledoc """
  This service allows you to query the performed operations.
  """
  alias PomeloEx.Cards.Credits.Operations.GetOperations

  @doc """
  Get operation
  The /operations endpoint allows you to perform a search with specific filters.

  Filters
  You can find more information on how to apply filters in the section [Filters and pagination](https://developers.pomelo.la/api-reference/filters).
  """
  defdelegate get_operations(payload), to: GetOperations, as: :execute
end
