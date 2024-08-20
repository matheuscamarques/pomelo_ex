defmodule PomeloEx.DigitalAccounts.Webhooks do
  @moduledoc """
  This service notifies you of all account activities.

  You will receive notifications for either the creation or modification of an activity. To determine the type of case, read the type field, which will show one of these values:

   - ACTIVITY_CREATED: when a new activity is created.
   - ACTIVITY_UPDATED: when an activity is modified. Activities may change their status from PENDING to APPROVED or from PENDING to REJECTED.
  You can find more information in the [Webhooks Configuration](https://docs.pomelo.la/en/docs/developers/webhooks).

  You can also find more information about the [Verification Process](https://docs.pomelo.la/docs/developers/key-exchange) of the digital signature.
  """
  alias PomeloEx.DigitalAccounts.Webhooks.ActivityNotification

  @doc """
  Activity notification
  The following endpoint must be in the client service so that it can receive the requests of the activities created/updated. If the request returns an HTTP code of type 2xx, it will not be sent again and will be marked as Sent correctly. Otherwise, we will try again.
  """
  defdelegate activity_notification(payload), to: ActivityNotification, as: :execute
end
