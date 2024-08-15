defmodule PomeloEx.FraudPrevention.TravelNotice do
  @moduledoc """
  Pomelo's Travel Notification is a service that enables you to temporarily increase the transaction limits for your users when they make purchases in a different country. If they have multiple cards, the Travel Notification will apply to all of them.
  """

  alias PomeloEx.FraudPrevention.TravelNotice.CreateTravelNotice
  alias PomeloEx.FraudPrevention.TravelNotice.ObtainTravelNotification
  alias PomeloEx.FraudPrevention.TravelNotice.UpdateTravelNotification

  defdelegate create_travel_notice(payload), to: CreateTravelNotice, as: :execute
  defdelegate obtain_travel_notification(payload), to: ObtainTravelNotification, as: :execute
  defdelegate update_travel_notification(payload), to: UpdateTravelNotification, as: :execute
end
