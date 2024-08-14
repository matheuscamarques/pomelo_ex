defmodule PomeloEx.Cards.Issuing.Shipments do
  @moduledoc """
  The Shipping API comprises all the endpoints for creating shipments and retrieving data for your created shipments. You will also find endpoints to receive notifications about updates on the status of your shipments via a webhook.

  External shipments#
  When defining your integration, you will have the option to NOT use our card distribution service.

  In that case, the affinity groups will reflect the settings you have chosen. Also, when creating a card or a batch of cards, we will return an identifier in the shipment_id field, which we recommend you store in your integration, since you will need it for pick-up. The cards will be available for pick-up at the embossing facility specified in integration.
  """

  alias PomeloEx.Cards.Issuing.Shipments.ChangeShipmentData
  alias PomeloEx.Cards.Issuing.Shipments.CreateShipment
  alias PomeloEx.Cards.Issuing.Shipments.GetShipment
  alias PomeloEx.Cards.Issuing.Shipments.GetShipmentHistory
  alias PomeloEx.Cards.Issuing.Shipments.RequestReceiverData
  alias PomeloEx.Cards.Issuing.Shipments.SearchShipment
  alias PomeloEx.Cards.Issuing.Shipments.ShipmentNotifications

  defdelegate change_shipment_data(payload), to: ChangeShipmentData, as: :execute
  defdelegate create_shipment(payload), to: CreateShipment, as: :execute
  defdelegate get_shipment(payload), to: GetShipment, as: :execute
  defdelegate get_shipment_history(payload), to: GetShipmentHistory, as: :execute
  defdelegate request_receiver_data(payload), to: RequestReceiverData, as: :execute
  defdelegate search_shipment(payload), to: SearchShipment, as: :execute
  defdelegate shipment_notifications(payload), to: ShipmentNotifications, as: :execute
end
