defmodule PomeloEx.Loyalty.PendingPointsNotificationTest do
  use ExUnit.Case

  alias PomeloEx.Loyalty.PendingPointsNotification
  alias PomeloEx.LoyaltyFixtures

  test "Success 200 - Pending Points Notification" do
    payload = LoyaltyFixtures.pending_points_notification_request()

    {:ok, response} = PendingPointsNotification.execute(payload)

    assert response.event_id == "loyalty-pending"
    assert response.idempotency_key == "ctx-38Wig8u500urqNCgMAy1vE4voXl-pending"
  end
end
