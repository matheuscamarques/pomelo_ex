defmodule PomeloEx.Cards.Issuing.Cards.UpdateCardTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.CardsFixtures
  alias PomeloEx.Cards.Issuing.Cards.UpdateCard

  test "Success 200 - Update Card" do
    payload = CardsFixtures.update_card_request()

    expect(HTTPMock, :patch, fn url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/cards/v1/#{payload.id}"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CardsFixtures.update_card_response()
       }}
    end)

    {:ok, response} = UpdateCard.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.id
    assert body["data"]["status"] == "BLOCKED"
  end
end
