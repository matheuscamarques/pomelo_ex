defmodule PomeloEx.Cards.Credits.Webhooks.CreditLinePauseUnpauseNotifications do
  @moduledoc """
  Webhook handler for credit line pause/unpause notifications.

  Notifies when a credit line is paused or unpaused.
  You must respond with a 2xx HTTP status code, otherwise the notification will be resent.
  """

  def execute(_payload) do
    {:ok, %{status: 200}}
  end
end
