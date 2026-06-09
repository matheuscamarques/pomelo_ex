defmodule PomeloEx.Cards.Credits.CreditLinesV2.GetProductTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLinesV2.GetProduct
  alias PomeloEx.Cards.Credits.CreditLinesV2Fixtures

  test "Success 200 - Get Product" do
    payload = CreditLinesV2Fixtures.get_product_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v2/products/lpr-v2-product-id"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CreditLinesV2Fixtures.get_product_response()
       }}
    end)

    {:ok, response} = GetProduct.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "lpr-v2-product-id"
  end
end
