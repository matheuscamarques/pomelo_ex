defmodule PomeloEx.Cards.Tokenization.Webhooks.OtpShippingNotifications do
  @moduledoc false

  alias PomeloEx.Types.Cards.Tokenization.Webhooks.OtpShippingNotificationsType

  def execute(%OtpShippingNotificationsType{} = payload) do
    {:ok, payload}
  end
end
