defmodule PomeloEx.Cards.Tokenization.Webhooks do
  @moduledoc """
  This service notifies you of events related to tokenization.
  """
  alias PomeloEx.Cards.Tokenization.Webhooks.OtpShippingNotifications
  alias PomeloEx.Cards.Tokenization.Webhooks.TokenEventNotifications

  @doc """
  Token event notifications
  """
  defdelegate token_event_notification(payload),
    to: TokenEventNotifications,
    as: :execute

  defdelegate token_event_notifications(payload),
    to: TokenEventNotifications,
    as: :execute

  @doc """
  OTP shipping notifications
  """
  defdelegate otp_shipping_notification(payload),
    to: OtpShippingNotifications,
    as: :execute

  defdelegate otp_shipping_notifications(payload),
    to: OtpShippingNotifications,
    as: :execute
end
