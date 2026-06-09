defmodule PomeloEx.FraudPrevention.TravelNotice do
  @moduledoc """
  Travel notification management (legacy API).

  Temporarily increases transaction limits for users making purchases abroad.
  Travel notices apply to all cards belonging to the user.
  """
  alias PomeloEx.FraudPrevention.TravelNotice.CreateTravelNotice
  alias PomeloEx.FraudPrevention.TravelNotice.ObtainTravelNotification
  alias PomeloEx.FraudPrevention.TravelNotice.UpdateTravelNotification

  @doc """
  Obtain travel notification
  With this endpoint, you can check if a user has an active travel notification.
  """
  defdelegate obtain_travel_notification(payload), to: ObtainTravelNotification, as: :execute

  @doc """
  Create travel notice
  Please note that this increase in limits applies only if international transactions are allowed, based on the user's card affinity group definition.
  """
  defdelegate create_travel_notice(payload), to: CreateTravelNotice, as: :execute

  @doc """
  Update travel notification
    - Expire the travel notification before the established time: Include a date earlier than the current date as the expiration date in the travel notification.
    - Extend the travel notification: Set a new expiration date later than the original one.
    - Modify or add destination countries: Update the array of destination countries.
  """
  defdelegate update_travel_notification(payload), to: UpdateTravelNotification, as: :execute
end
