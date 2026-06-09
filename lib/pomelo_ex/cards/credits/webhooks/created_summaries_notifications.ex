defmodule PomeloEx.Cards.Credits.Webhooks.CreatedSummariesNotifications do
  @moduledoc """
  Webhook handler for created summaries notifications.

  Notifies when a credit account summary is created.
  You must respond with a 2xx HTTP status code, otherwise the notification will be resent.
  """

  def execute(_payload) do
    {:ok, %{status: 200}}
  end
end
