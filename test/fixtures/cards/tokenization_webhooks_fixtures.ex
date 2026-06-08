defmodule PomeloEx.Cards.TokenizationWebhooksFixtures do
  alias PomeloEx.Types.Cards.Tokenization.Webhooks.OtpShippingNotificationsType
  alias PomeloEx.Types.Cards.Tokenization.Webhooks.TokenEventNotificationsType

  def token_event_notifications_request do
    %TokenEventNotificationsType{
      event_id: "evt-12345",
      type: "TOKEN_ACTIVATED",
      data: %{
        "token_id" => "tok-12345",
        "card_id" => "crd-12345",
        "status" => "ACTIVE"
      }
    }
  end

  def otp_shipping_notification_request do
    %OtpShippingNotificationsType{
      event_id: "evt-67890",
      type: "OTP_SENT",
      data: %{
        "otp_code" => "123456",
        "card_id" => "crd-12345",
        "delivery_method" => "SMS"
      }
    }
  end
end
