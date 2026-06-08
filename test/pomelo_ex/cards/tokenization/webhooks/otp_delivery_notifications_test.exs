defmodule PomeloEx.Cards.Tokenization.Webhooks.OtpDeliveryNotificationsTest do
  use ExUnit.Case

  alias PomeloEx.Cards.Tokenization.Webhooks.OtpDeliveryNotifications
  alias PomeloEx.Cards.TokenizationWebhooksFixtures

  test "Success - OTP Delivery Notifications Webhook" do
    payload = TokenizationWebhooksFixtures.otp_delivery_notifications_request()

    {:ok, response} = OtpDeliveryNotifications.execute(payload)
    assert response.event_id == payload.event_id
  end
end
