defmodule PomeloEx.Cards.Credits.Webhooks.EntryExitFromArrearsUserNotifications do
  @moduledoc """
  Webhook handler for credit arrears notifications.

  Notifies when a user enters or exits arrears status on a credit line.
  You must respond with a 2xx HTTP status code, otherwise the notification will be resent.
  """

  def execute(_payload) do
    {:ok, %{status: 200}}
  end
end
