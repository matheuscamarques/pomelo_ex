defmodule PomeloEx.DigitalAccounts.Queries do
  alias PomeloEx.DigitalAccounts.Queries.GetAccount
  alias PomeloEx.DigitalAccounts.Queries.GetActivity
  alias PomeloEx.DigitalAccounts.Queries.ListAccounts
  alias PomeloEx.DigitalAccounts.Queries.ListActivities

  defdelegate get_account(payload), to: GetAccount, as: :execute

  defdelegate get_activity(payload), to: GetActivity, as: :execute

  defdelegate list_accounts(payload), to: ListAccounts, as: :execute

  defdelegate list_activities(payload), to: ListActivities, as: :execute
end
