defmodule PomeloEx.Cards.Issuing.Cards.CreateBatchInnominateCardsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.CardsFixtures
  alias PomeloEx.Cards.Issuing.Cards.CreateBatchInnominateCards

  test "Success 201 - Create Batch Innominate Cards" do
    payload = CardsFixtures.create_batch_innominate_cards_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/cards/v1/batches"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 201,
         body: CardsFixtures.create_batch_innominate_cards_response()
       }}
    end)

    {:ok, response} = CreateBatchInnominateCards.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["batch_id"] == "bat-12345"
  end
end
