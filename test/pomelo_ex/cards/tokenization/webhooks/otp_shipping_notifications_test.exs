defmodule PomeloEx.Cards.Tokenization.Webhooks.OtpShippingNotificationsTest do
  use ExUnit.Case

  alias PomeloEx.Cards.Tokenization.Webhooks.OtpShippingNotifications
  alias PomeloEx.Cards.TokenizationWebhooksFixtures

  test "Success - OTP Shipping Notifications Webhook" do
    payload = TokenizationWebhooksFixtures.otp_shipping_notification_request()

    {:ok, response} = OtpShippingNotifications.execute(payload)
    assert response.event_id == payload.event_id
  end
end
