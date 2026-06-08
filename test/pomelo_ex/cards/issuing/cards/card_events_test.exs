defmodule PomeloEx.Cards.Issuing.Cards.CardEventsTest do
  use ExUnit.Case

  alias PomeloEx.Cards.CardsFixtures
  alias PomeloEx.Cards.Issuing.Cards.CardEvents

  test "Success - Card Events Webhook" do
    payload = CardsFixtures.card_events_request()

    {:ok, response} = CardEvents.execute(payload)
    assert response.event_id == payload.event_id
  end
end
