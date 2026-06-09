defmodule PomeloEx.Cards.Issuing.Cards.GetCardTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.CardsFixtures
  alias PomeloEx.Cards.Issuing.Cards.GetCard

  test "Success 200 - Get Card" do
    payload = CardsFixtures.get_card_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/cards/v1/#{payload.id}"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CardsFixtures.get_card_response()
       }}
    end)

    {:ok, response} = GetCard.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.id
  end
end
