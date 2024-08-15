defmodule PomeloEx.Cards.Credits.Statements do
  @moduledoc """
  This service allows you to inquire about the account statements for the different Credit Lines. Find more information about Account Statements in our [documentation](https://docs.pomelo.la/docs/cards/lending/statements).
  """

  alias PomeloEx.Cards.Credits.Statements.GetFollowingStatements
  alias PomeloEx.Cards.Credits.Statements.GetLastStatements
  alias PomeloEx.Cards.Credits.Statements.GetStatement
  alias PomeloEx.Cards.Credits.Statements.SearchAccountStatements

  defdelegate get_following_statements(payload), to: GetFollowingStatements, as: :execute
  defdelegate get_last_statements(payload), to: GetLastStatements, as: :execute
  defdelegate get_statement(payload), to: GetStatement, as: :execute
  defdelegate search_account_statements(payload), to: SearchAccountStatements, as: :execute
end
