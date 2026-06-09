defmodule PomeloEx.DigitalAccounts.Webhooks do
  @moduledoc """
  Webhook notifications for digital account activities.

  Receives real-time notifications when account activities are created (`ACTIVITY_CREATED`)
  or modified (`ACTIVITY_UPDATED`), including status changes from PENDING to APPROVED/REJECTED.
  """
  alias PomeloEx.DigitalAccounts.Webhooks.ActivityNotification

  @doc """
  Activity notification
  The following endpoint must be in the client service so that it can receive the requests of the activities created/updated. If the request returns an HTTP code of type 2xx, it will not be sent again and will be marked as Sent correctly. Otherwise, we will try again.
  """
  defdelegate activity_notification(payload), to: ActivityNotification, as: :execute
end
