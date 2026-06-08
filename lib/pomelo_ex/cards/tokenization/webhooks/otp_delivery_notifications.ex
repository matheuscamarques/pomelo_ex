defmodule PomeloEx.Cards.Tokenization.Webhooks.OtpDeliveryNotifications do
  @moduledoc false

  alias PomeloEx.Types.Cards.Tokenization.Webhooks.OtpDeliveryNotificationsType

  def execute(%OtpDeliveryNotificationsType{} = payload) do
    {:ok, payload}
  end
end
