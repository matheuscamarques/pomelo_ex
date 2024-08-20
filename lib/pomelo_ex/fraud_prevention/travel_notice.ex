defmodule PomeloEx.FraudPrevention.TravelNotice do
  @moduledoc """
  Pomelo's Travel Notification is a service that enables you to temporarily increase the transaction limits for your users when they make purchases in a different country. If they have multiple cards, the Travel Notification will apply to all of them.
  """

  @doc """
  Obtain travel notification
  With this endpoint, you can check if a user has an active travel notification.
  """
  alias PomeloEx.FraudPrevention.TravelNotice.ObtainTravelNotification
  defdelegate obtain_travel_notification(payload), to: ObtainTravelNotification, as: :execute

  @doc """
  Create travel notice
  Please note that this increase in limits applies only if international transactions are allowed, based on the user's card affinity group definition.
  """
  alias PomeloEx.FraudPrevention.TravelNotice.CreateTravelNotice
  defdelegate create_travel_notice(payload), to: CreateTravelNotice, as: :execute

  @doc """
  Update travel notification
    - Expire the travel notification before the established time: Include a date earlier than the current date as the expiration date in the travel notification.
    - Extend the travel notification: Set a new expiration date later than the original one.
    - Modify or add destination countries: Update the array of destination countries.
  """
  alias PomeloEx.FraudPrevention.TravelNotice.UpdateTravelNotification
  defdelegate update_travel_notification(payload), to: UpdateTravelNotification, as: :execute
end
