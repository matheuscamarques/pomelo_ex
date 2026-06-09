defmodule PomeloEx.Cards.Credits.Webhooks.ReversedTransactionsNotifications do
  @moduledoc """
  Webhook handler for reversed credit transaction notifications.

  Notifies when a credit card transaction is reversed.
  You must respond with a 2xx HTTP status code, otherwise the notification will be resent.
  """

  def execute(_payload) do
    {:ok, %{status: 200}}
  end
end
