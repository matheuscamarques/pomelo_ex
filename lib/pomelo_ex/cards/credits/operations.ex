defmodule PomeloEx.Cards.Credits.Operations do
  @moduledoc """
  This service allows you to query the performed operations.
  """

  @doc """
  Get operation
  The /operations endpoint allows you to perform a search with specific filters.

  Filters#
  You can find more information on how to apply filters in the section [Filters and pagination](https://developers.pomelo.la/api-reference/filters).
  """
  alias PomeloEx.Cards.Credits.Operations.GetOperations
  defdelegate get_operations(payload), to: GetOperations, as: :execute
end
