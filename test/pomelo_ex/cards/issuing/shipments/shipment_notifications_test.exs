defmodule PomeloEx.Cards.Issuing.Shipments.ShipmentNotificationsTest do
  use ExUnit.Case

  alias PomeloEx.Cards.Issuing.Shipments.ShipmentNotifications
  alias PomeloEx.Cards.ShipmentsFixtures

  test "Success - Shipment Notifications Webhook" do
    payload = ShipmentsFixtures.shipment_notifications_request()

    {:ok, response} = ShipmentNotifications.execute(payload)
    assert response.event_id == payload.event_id
  end
end
