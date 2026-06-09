defmodule PomeloEx.Cards.Credits.CreditLinesV2.DeactivateProductTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLinesV2.DeactivateProduct
  alias PomeloEx.Cards.Credits.CreditLinesV2Fixtures

  test "Success 200 - Deactivate Product" do
    payload = CreditLinesV2Fixtures.deactivate_product_request()

    expect(HTTPMock, :delete, fn url, _, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v2/products/lpr-v2-product-id"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditLinesV2Fixtures.deactivate_product_response()
       }}
    end)

    {:ok, response} = DeactivateProduct.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["lifecycle"]["status"] == "DEACTIVATED"
  end
end
