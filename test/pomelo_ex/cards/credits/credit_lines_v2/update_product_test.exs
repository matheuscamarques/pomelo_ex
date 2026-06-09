defmodule PomeloEx.Cards.Credits.CreditLinesV2.UpdateProductTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLinesV2.UpdateProduct
  alias PomeloEx.Cards.Credits.CreditLinesV2Fixtures

  test "Success 200 - Update Product" do
    payload = CreditLinesV2Fixtures.update_product_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :patch, url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v2/products/lpr-v2-product-id"

      sent_body = Jason.decode!(body)
      assert sent_body["name"] == "Updated Product"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CreditLinesV2Fixtures.update_product_response()
       }}
    end)

    {:ok, response} = UpdateProduct.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["name"] == "Updated Product"
  end
end
