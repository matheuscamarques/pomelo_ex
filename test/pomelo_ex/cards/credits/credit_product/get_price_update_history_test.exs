defmodule PomeloEx.Cards.Credits.CreditProduct.GetPriceUpdateHistoryTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditProduct.GetPriceUpdateHistory
  alias PomeloEx.Cards.Credits.CreditProductFixtures

  test "Success 200 - Get Price Update History" do
    payload = CreditProductFixtures.get_price_update_history_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/products/lpr-2HMvSzWjc5La6WDTlgFweXAmPle/pricing"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CreditProductFixtures.get_price_update_history_response()
       }}
    end)

    {:ok, response} = GetPriceUpdateHistory.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"] |> List.first() |> Map.get("start_date") == "2024-01-15"
  end
end
