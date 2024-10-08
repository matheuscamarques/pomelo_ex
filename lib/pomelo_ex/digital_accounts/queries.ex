defmodule PomeloEx.DigitalAccounts.Queries do
  @moduledoc false
  alias PomeloEx.DigitalAccounts.Queries.GetAccount
  alias PomeloEx.DigitalAccounts.Queries.GetActivity
  alias PomeloEx.DigitalAccounts.Queries.ListAccounts
  alias PomeloEx.DigitalAccounts.Queries.ListActivities

  @doc """
  List activities
  The endpoint /core/activities/v1 returns a paginated list of all activities. You can [use filters](https://developers.pomelo.la/api-reference/filters) to retrieve activities related to certain details, such as those associated with a specific account or those within a date range, among other options.
  """
  defdelegate list_activities(payload), to: ListActivities, as: :execute

  @doc """
  Get activity
  The '/core/activities/v1/{id}' endpoint enables you to get information about any activity specified.
  """
  defdelegate get_activity(payload), to: GetActivity, as: :execute

  @doc """
  List Accounts
  The endpoint /core/accounts/v1 returns a paginated list of digital accounts with their balances and other relevant information.
  """
  defdelegate list_accounts(payload), to: ListAccounts, as: :execute

  @doc """
  Get account
  The endpoint /core/accounts/v1/{id} returns the account information you request, along with its balance.
  """
  defdelegate get_account(payload), to: GetAccount, as: :execute
end
