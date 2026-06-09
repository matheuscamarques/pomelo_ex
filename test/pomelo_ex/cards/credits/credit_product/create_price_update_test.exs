defmodule PomeloEx.Cards.Credits.CreditProduct.CreatePriceUpdateTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditProduct.CreatePriceUpdate
  alias PomeloEx.Cards.Credits.CreditProductFixtures

  test "Success 201 - Create Price Update" do
    payload = CreditProductFixtures.create_price_update_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/products/lpr-2HMvSzWjc5La6WDTlgFweXAmPle/pricing"

      sent_body = Jason.decode!(body)
      assert sent_body["start_date"] == "2024-01-15"

      {:ok,
       %HTTPoison.Response{
         status_code: 201,
         body: CreditProductFixtures.create_price_update_response()
       }}
    end)

    {:ok, response} = CreatePriceUpdate.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["start_date"] == "2024-01-15"
  end
end
