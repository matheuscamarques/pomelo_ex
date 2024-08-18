defmodule PomeloEx.Cards.Credits.Statements do
  @moduledoc """
  This service allows you to inquire about the account statements for the different Credit Lines. Find more information about Account Statements in our [documentation](https://docs.pomelo.la/docs/cards/lending/statements).
  """

  @doc """
  Get a Statement
  El endpoint /credit-lines/{credit-line-id}/statements/{id} te permite obtener un resumen específico a partir de un ID de statement
  """
  alias PomeloEx.Cards.Credits.Statements.GetStatement
  defdelegate get_statement(payload), to: GetStatement, as: :execute

  @doc """
  Search Account Statements
  The endpoint /credit-lines/{credit-line-id}/statements allows you to search statements by specifying attributes.

  Filters#
  You can find more information on how to apply filters in the section [Filters and pagination](https://developers.pomelo.la/api-reference/filters).
  """
  alias PomeloEx.Cards.Credits.Statements.SearchAccountStatements
  defdelegate search_account_statements(payload), to: SearchAccountStatements, as: :execute

  @doc """
    Get Last Statement
    The /credit-lines/{credit-line-id}/statements/last endpoint allows you to get the last generated statement.
  """
  alias PomeloEx.Cards.Credits.Statements.GetLastStatements
  defdelegate get_last_statements(payload), to: GetLastStatements, as: :execute

  @doc """
  Get the following Statement
  The endpoint /credit-lines/{credit-line-id}/statements/next allows you to obtain the statement for the current period.
  """
  alias PomeloEx.Cards.Credits.Statements.GetFollowingStatements
  defdelegate get_following_statements(payload), to: GetFollowingStatements, as: :execute
end
