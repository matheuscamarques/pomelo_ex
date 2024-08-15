defmodule PomeloEx.Cards.Processing.Transactions do
  @moduledoc """
  You must implement and expose the “Authorization” and “ Adjustments” endpoints on your backend so that we can communicate.

  See [documentation](https://developers.pomelo.la/en/api-reference/cards/processing/transactions) to know the processor flow
  """

  alias PomeloEx.Cards.Processing.Transactions.Adjustments
  alias PomeloEx.Cards.Processing.Transactions.AuthorizeTransaction
  alias PomeloEx.Cards.Processing.Transactions.Notifications

  defdelegate adjustments(payload), to: Adjustments, as: :execute
  defdelegate authorize_transaction(payload), to: AuthorizeTransaction, as: :execute
  defdelegate notifications(payload), to: Notifications, as: :execute
end
