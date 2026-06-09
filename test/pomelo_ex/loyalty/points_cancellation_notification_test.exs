defmodule PomeloEx.Loyalty.PointsCancellationNotificationTest do
  use ExUnit.Case

  alias PomeloEx.Loyalty.PointsCancellationNotification
  alias PomeloEx.LoyaltyFixtures

  test "Success 200 - Points Cancellation Notification" do
    payload = LoyaltyFixtures.points_cancellation_notification_request()

    {:ok, response} = PointsCancellationNotification.execute(payload)

    assert response.event_id == "loyalty-cancel"
    assert response.idempotency_key == "lye-38WileXCmO8aODJY0BjlndumK0x-cancel"
  end
end
