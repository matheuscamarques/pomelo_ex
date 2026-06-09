defmodule PomeloEx.Cards.Credits.DebtSaleToBanks do
  @moduledoc """
  Webhooks for debt sale to banks (Bancarización de deuda).

  These webhooks notify you about the lifecycle of debts sold to banks.
  Each time a relevant event occurs (debt creation, payment, transfer, adjustment, or cancellation),
  we will send a notification to your system.

  All webhooks are sent as POST requests with the following HTTP headers:
  - `X-Api-Key`: identifies which api-secret to use for signature verification
  - `X-Signature`: HMAC-SHA256 digital signature (body + timestamp + endpoint)
  - `X-Timestamp`: unix-epoch timestamp of when the order was signed
  - `X-Endpoint`: the endpoint to which the request is made

  You must respond with a 2xx HTTP status code, otherwise the notification will be resent.

  Want to know more about debt sale to banks? Check out our [documentation](https://docs.pomelo.la/docs/cards/lending/debt-sale-to-banks).
  """
  alias PomeloEx.Cards.Credits.DebtSaleToBanks.DebtAdjustmentNotification
  alias PomeloEx.Cards.Credits.DebtSaleToBanks.DebtCancellationNotification
  alias PomeloEx.Cards.Credits.DebtSaleToBanks.DebtCreationNotification
  alias PomeloEx.Cards.Credits.DebtSaleToBanks.DebtPaymentNotification
  alias PomeloEx.Cards.Credits.DebtSaleToBanks.DebtTransferNotification

  @doc """
  Webhook: Debt Creation
  Notifies when a debt is created and transferred to a bank.
  Debt types: CURRENT_CYCLE_CHARGES, REVOLVING, MANDATORY_REFINANCING, MANUAL_REFINANCING.
  """
  defdelegate debt_creation_notification(payload), to: DebtCreationNotification, as: :execute

  @doc """
  Webhook: Debt Payment
  Notifies when a payment (full or partial) is registered on a debt.
  Debt states: FULFILLED (fully paid), PARTIALLY_FULFILLED (still has pending balance).
  """
  defdelegate debt_payment_notification(payload), to: DebtPaymentNotification, as: :execute

  @doc """
  Webhook: Debt Transfer
  Notifies when a debt is transferred to another debt, either due to expiration (DUE_DEBT) or refinancing (REFINANCED).
  """
  defdelegate debt_transfer_notification(payload), to: DebtTransferNotification, as: :execute

  @doc """
  Webhook: Debt Adjustment
  Notifies when adjustments are made to a debt, such as discounts on interest, principal, or taxes.
  """
  defdelegate debt_adjustment_notification(payload), to: DebtAdjustmentNotification, as: :execute

  @doc """
  Webhook: Debt Cancellation
  Notifies when a debt is cancelled due to account closure.
  """
  defdelegate debt_cancellation_notification(payload), to: DebtCancellationNotification, as: :execute
end
