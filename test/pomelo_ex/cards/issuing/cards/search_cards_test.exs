defmodule PomeloEx.Cards.Issuing.Cards.SearchCardsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.CardsFixtures
  alias PomeloEx.Cards.Issuing.Cards.SearchCards

  test "Success 200 - Search Cards" do
    payload = CardsFixtures.search_cards_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url =~ Application.get_env(:pomelo_ex, :url) <> "/cards/v1/?"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CardsFixtures.search_cards_response()
       }}
    end)

    {:ok, response} = SearchCards.execute(payload)

    body = Jason.decode!(response.body)
    assert is_list(body["data"])
    assert hd(body["data"])["id"] == "crd-12345"
  end
end
