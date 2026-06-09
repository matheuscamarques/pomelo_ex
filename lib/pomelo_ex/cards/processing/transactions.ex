defmodule PomeloEx.Cards.Processing.Transactions do
  @moduledoc """
  Transaction authorization, adjustments, and notifications.

  These endpoints must be implemented and exposed on your backend so the Pomelo platform
  can communicate authorization requests, adjustments, and settlement notifications.

  ## Flow

  1. `authorize_transaction/1` — Authorize or reject a transaction
  2. `adjustments/1` — Handle credit/debit adjustments during settlement
  3. Receive webhook notifications for presentments and OTP codes
  """
  alias PomeloEx.Cards.Processing.Transactions.Adjustments
  alias PomeloEx.Cards.Processing.Transactions.AuthorizeTransaction
  alias PomeloEx.Cards.Processing.Transactions.CardShippingOfOtpCodes
  alias PomeloEx.Cards.Processing.Transactions.Notifications
  alias PomeloEx.Cards.Processing.Transactions.PresentmentsNotifications

  @doc """
  Authorize transaction
  The /transactions/authorizations endpoint allows you to authorize transactions.

  A request to authorize or reject the transaction will be sent.

  Considerations
  We expect a quick response to ensure a good experience. If the response is delayed, reject the transaction.
  """
  defdelegate authorize_transaction(payload), to: AuthorizeTransaction, as: :execute

  @doc """
  Adjustments
  The /transactions/adjustments/{type} endpoint allows you to make credit and debit adjustments to transactions.

  A request informing you that the network (MC, VISA) forced an authorization will be sent.

  Considerations
  This endpoint is used during reconciliation and online flows, mainly to make adjustments during the settlement process and also in the event of returns.
  """
  defdelegate adjustments(payload), to: Adjustments, as: :execute

  @doc """
  Notifications
  This service allows notifications when a transaction is resolved, either by Pomelo or by the brand (Mastercard, Visa, etc.).

  Considerations
  We are waiting for a 2XX response to ensure the notification was received. Otherwise, we will send it again.
  """
  defdelegate notifications(payload), to: Notifications, as: :execute

  @doc """
  Notifications of Presentments
  This service allows notifications when a presentment is resolved.
  """
  defdelegate presentments_notifications(payload), to: PresentmentsNotifications, as: :execute

  @doc """
  3DS OTP Shipping Codes Notification
  This service allows notification to ship 3DS OTP codes.
  """
  defdelegate card_shipping_of_otp_codes(payload), to: CardShippingOfOtpCodes, as: :execute
end
