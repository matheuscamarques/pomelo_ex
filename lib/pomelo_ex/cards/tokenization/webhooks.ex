defmodule PomeloEx.Cards.Tokenization.Webhooks do
  @moduledoc """
  This service notifies you of events related to tokenization.
  """
  alias PomeloEx.Cards.Tokenization.Webhooks.OtpDeliveryNotifications
  alias PomeloEx.Cards.Tokenization.Webhooks.TokenEventNotifications

  @doc """
  Token event notifications
  """
  defdelegate token_event_notifications(payload),
    to: TokenEventNotifications,
    as: :execute

  @doc """
  OTP delivery notifications
  """
  defdelegate otp_delivery_notifications(payload),
    to: OtpDeliveryNotifications,
    as: :execute
end
