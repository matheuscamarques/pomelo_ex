defmodule PomeloEx.Cards.Credits.Webhooks.ProcessedTransactionsNotifications do
  @moduledoc """
  Webhook handler for processed credit transaction notifications.

  Notifies when a credit card transaction is processed.
  You must respond with a 2xx HTTP status code, otherwise the notification will be resent.
  """

  def execute(_payload) do
    {:ok, %{status: 200}}
  end
end
