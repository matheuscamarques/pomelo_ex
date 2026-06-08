defmodule PomeloEx.Cards.Tokenization.Webhooks.TokenEventNotifications do
  @moduledoc false

  alias PomeloEx.Types.Cards.Tokenization.Webhooks.TokenEventNotificationsType

  def execute(%TokenEventNotificationsType{} = payload) do
    {:ok, payload}
  end
end
