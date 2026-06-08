defmodule PomeloEx.Cards.Issuing.Cards.CreateMultipleBatchInnominateCardsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.CardsFixtures
  alias PomeloEx.Cards.Issuing.Cards.CreateMultipleBatchInnominateCards

  test "Success 201 - Create Multiple Batch Innominate Cards" do
    payload = CardsFixtures.create_multiple_batch_innominate_cards_request()

    expect(HTTPMock, :post, fn url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/cards/v1/batches/bulk"

      {:ok,
       %HTTPoison.Response{
         status_code: 201,
         body: CardsFixtures.create_multiple_batch_innominate_cards_response()
       }}
    end)

    {:ok, response} = CreateMultipleBatchInnominateCards.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["bulk_id"] == "blk-12345"
    assert body["data"]["status"] == "PROCESSING"
  end
end
