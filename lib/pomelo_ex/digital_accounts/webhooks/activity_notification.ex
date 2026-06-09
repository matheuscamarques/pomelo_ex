defmodule PomeloEx.DigitalAccounts.Webhooks.ActivityNotification do
  @moduledoc """
  Webhook handler for digital account activity notifications.

  Receives real-time notifications when account activities are created (`ACTIVITY_CREATED`)
  or modified (`ACTIVITY_UPDATED`), including status changes from PENDING to APPROVED/REJECTED.

  You must respond with a 2xx HTTP status code, otherwise the notification will be resent.
  """

  def execute(_payload) do
    {:ok, %{status: 200}}
  end
end
