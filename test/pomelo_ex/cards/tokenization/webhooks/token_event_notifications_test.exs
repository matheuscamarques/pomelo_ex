defmodule PomeloEx.Cards.Tokenization.Webhooks.TokenEventNotificationsTest do
  use ExUnit.Case

  alias PomeloEx.Cards.Tokenization.Webhooks.TokenEventNotifications
  alias PomeloEx.Cards.TokenizationWebhooksFixtures

  test "Success - Token Event Notifications Webhook" do
    payload = TokenizationWebhooksFixtures.token_event_notifications_request()

    {:ok, response} = TokenEventNotifications.execute(payload)
    assert response.event_id == payload.event_id
  end
end
