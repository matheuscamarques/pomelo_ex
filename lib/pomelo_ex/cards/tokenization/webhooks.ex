defmodule PomeloEx.Cards.Tokenization.Webhooks do
  @moduledoc """
  Webhook notifications for token lifecycle events.

  Receives real-time notifications when token events occur (creation, suspension,
  deletion) and when OTP codes are shipped for 3DS authentication.
  """
  alias PomeloEx.Cards.Tokenization.Webhooks.OtpShippingNotifications
  alias PomeloEx.Cards.Tokenization.Webhooks.TokenEventNotifications

  @doc """
  Token event notifications (singular alias).
  """
  defdelegate token_event_notification(payload),
    to: TokenEventNotifications,
    as: :execute

  @doc """
  Token event notifications (plural alias).
  """
  defdelegate token_event_notifications(payload),
    to: TokenEventNotifications,
    as: :execute

  @doc """
  OTP shipping notifications (singular alias).
  """
  defdelegate otp_shipping_notification(payload),
    to: OtpShippingNotifications,
    as: :execute

  @doc """
  OTP shipping notifications (plural alias).
  """
  defdelegate otp_shipping_notifications(payload),
    to: OtpShippingNotifications,
    as: :execute
end
