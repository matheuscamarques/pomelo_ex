defmodule PomeloEx.Loyalty.PointsConfirmationNotificationTest do
  use ExUnit.Case

  alias PomeloEx.Loyalty.PointsConfirmationNotification
  alias PomeloEx.LoyaltyFixtures

  test "Success 200 - Points Confirmation Notification" do
    payload = LoyaltyFixtures.points_confirmation_notification_request()

    {:ok, response} = PointsConfirmationNotification.execute(payload)

    assert response.event_id == "loyalty-confirm"
    assert response.idempotency_key == "lye-38WileXCmO8aODJY0BjlndumK0x-confirm"
  end
end
