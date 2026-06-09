defmodule PomeloEx.Finance.Settlements do
  @moduledoc """
  Financial settlement management.

  Provides endpoints for querying available balances by country and currency,
  notifying deposits (with receipt upload), retrieving the latest settlement,
  and receiving new settlement webhook notifications.
  """
  alias PomeloEx.Finance.Settlements.GetBalances
  alias PomeloEx.Finance.Settlements.GetLastSettlement
  alias PomeloEx.Finance.Settlements.NewSettlement
  alias PomeloEx.Finance.Settlements.NotifyDeposit

  @doc """
  Get balances
  The /finance/v1/balances endpoint retrieves the available balances for the authenticated client by country.
  """
  defdelegate get_balances(payload), to: GetBalances, as: :execute

  @doc """
  Notify deposit
  The /finance/v1/deposits endpoint notifies a deposit for the authenticated client.
  The request should be sent as multipart/form-data to include the receipt file along with the form fields.
  """
  defdelegate notify_deposit(payload), to: NotifyDeposit, as: :execute

  @doc """
  Get last settlement
  The /finance/v1/settlements/latest endpoint retrieves the latest available settlement for the authenticated client by country.
  """
  defdelegate get_last_settlement(payload), to: GetLastSettlement, as: :execute

  @doc """
  New settlement
  Webhook that notifies when a new settlement is generated for the client.

  You must include this endpoint in your service so that we can provide you with real-time settlement updates.

  Considerations
  - We expect a response in the 2XX range to ensure that you've received the notification. Otherwise, we'll resend it.
  """
  defdelegate new_settlement(payload), to: NewSettlement, as: :execute
end
