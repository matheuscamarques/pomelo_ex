defmodule PomeloEx.Cards.Processing.Transactions do
  @moduledoc """
  You must implement and expose the “Authorization” and “ Adjustments” endpoints on your backend so that we can communicate.

  See [documentation](https://developers.pomelo.la/en/api-reference/cards/processing/transactions) to know the processor flow
  """

  @doc """
  Authorize transaction
  The /transactions/authorizations endpoint allows you to authorize transactions.

  A request to authorize or reject the transaction will be sent.

  Considerations
  We expect a quick response to ensure a good experience. If the response is delayed, reject the transaction.
  """
  alias PomeloEx.Cards.Processing.Transactions.AuthorizeTransaction
  defdelegate authorize_transaction(payload), to: AuthorizeTransaction, as: :execute

  @doc """
  Adjustments
  The /transactions/adjustments/{type} endpoint allows you to make credit and debit adjustments to transactions.

  A request informing you that the network (MC, VISA) forced an authorization will be sent.

  Considerations
  This endpoint is used during reconciliation and online flows, mainly to make adjustments during the settlement process and also in the event of returns.
  """
  alias PomeloEx.Cards.Processing.Transactions.Adjustments
  defdelegate adjustments(payload), to: Adjustments, as: :execute

  @doc """
  Notifications
  This service allows notifications when a transaction is resolved, either by Pomelo or by the brand (Mastercard, Visa, etc.).

  Considerations
  We are waiting for a 2XX response to ensure the notification was received. Otherwise, we will send it again.
  """
  defdelegate notifications(payload), to: Notifications, as: :execute
  alias PomeloEx.Cards.Processing.Transactions.Notifications
end
