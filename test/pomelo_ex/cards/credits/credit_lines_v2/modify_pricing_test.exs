defmodule PomeloEx.Cards.Credits.CreditLinesV2.ModifyPricingTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLinesV2.ModifyPricing
  alias PomeloEx.Cards.Credits.CreditLinesV2Fixtures

  test "Success 200 - Modify Pricing" do
    payload = CreditLinesV2Fixtures.modify_pricing_request()

    expect(HTTPMock, :patch, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v2/products/lpr-v2-product-id/pricing"

      sent_body = Jason.decode!(body)
      assert sent_body["start_date"] == "2024-02-01"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditLinesV2Fixtures.modify_pricing_response()
       }}
    end)

    {:ok, response} = ModifyPricing.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["start_date"] == "2024-02-01"
  end
end
