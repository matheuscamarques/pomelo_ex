defmodule PomeloEx.Cards.Issuing.Cards.ActivateCardTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.CardsFixtures
  alias PomeloEx.Cards.Issuing.Cards.ActivateCard

  test "Success 200 - Activate Card" do
    payload = CardsFixtures.activate_card_request()

    expect(HTTPMock, :post, fn url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/cards/v1/activation"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CardsFixtures.activate_card_response()
       }}
    end)

    {:ok, response} = ActivateCard.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.card_id
    assert body["data"]["status"] == "ACTIVE"
  end
end
