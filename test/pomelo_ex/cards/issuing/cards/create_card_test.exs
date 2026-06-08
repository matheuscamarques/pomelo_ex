defmodule PomeloEx.Cards.Issuing.Cards.CreateCardTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.CardsFixtures
  alias PomeloEx.Cards.Issuing.Cards.CreateCard

  test "Success 201 - Create Card" do
    payload = CardsFixtures.create_card_request()

    expect(HTTPMock, :post, fn url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/cards/v1/"

      {:ok,
       %HTTPoison.Response{
         status_code: 201,
         body: CardsFixtures.create_card_response()
       }}
    end)

    {:ok, response} = CreateCard.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "crd-12345"
  end
end
