defmodule PomeloEx.Cards.Credits.CreditLinesV2.CreatePricingTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLinesV2.CreatePricing
  alias PomeloEx.Cards.Credits.CreditLinesV2Fixtures

  test "Success 201 - Create Pricing" do
    payload = CreditLinesV2Fixtures.create_pricing_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v2/products/lpr-v2-product-id/pricing"

      sent_body = Jason.decode!(body)
      assert sent_body["start_date"] == "2024-01-01"

      {:ok,
       %HTTPoison.Response{
         status_code: 201,
         body: CreditLinesV2Fixtures.create_pricing_response()
       }}
    end)

    {:ok, response} = CreatePricing.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["start_date"] == "2024-01-01"
  end
end
