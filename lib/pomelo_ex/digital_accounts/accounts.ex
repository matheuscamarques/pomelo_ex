defmodule PomeloEx.DigitalAccounts.Accounts do
  @moduledoc false
  alias PomeloEx.DigitalAccounts.Accounts.CreateAccount
  alias PomeloEx.DigitalAccounts.Accounts.DeleteAccount
  alias PomeloEx.DigitalAccounts.Accounts.UpdateAccountStatus

  @doc """
  Create account
  The endpoint /core/accounts/v1 allows you to create a digital account for a Pomelo user.
  """
  defdelegate create_account(payload), to: CreateAccount, as: :execute

  @doc """
  Delete Account
  The /core/accounts/v1/{id} endpoint lets you delete a specific account. Its status will be changed to DELETED and can no longer be used to make transactions.
  """
  defdelegate delete_account(payload), to: DeleteAccount, as: :execute

  @doc """
  Update account status
  The endpoint /core/accounts/v1/{id} will be useful for changing the status of an account. Account states can be changed to ACTIVE, FROZEN or DISABLED. For the last two statuses, it is necessary to indicate the reason for the status change using the property status_update_motive.Find more information about account statuses in [our documentation](https://docs.pomelo.la/docs/cards/authorizer/home).
  """
  defdelegate update_account_status(payload), to: UpdateAccountStatus, as: :execute
end
