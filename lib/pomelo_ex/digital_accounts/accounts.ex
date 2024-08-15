defmodule PomeloEx.DigitalAccounts.Accounts do
  alias PomeloEx.DigitalAccounts.Accounts.CreateAccount
  alias PomeloEx.DigitalAccounts.Accounts.DeleteAccount
  alias PomeloEx.DigitalAccounts.Accounts.UpdateAccountStatus

  defdelegate create_account(payload), to: CreateAccount, as: :execute
  defdelegate delete_account(payload), to: DeleteAccount, as: :execute
  defdelegate update_account_status(payload), to: UpdateAccountStatus, as: :execute
end
