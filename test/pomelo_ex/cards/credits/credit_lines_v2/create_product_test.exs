defmodule PomeloEx.Cards.Credits.CreditLinesV2.CreateProductTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLinesV2.CreateProduct
  alias PomeloEx.Cards.Credits.CreditLinesV2Fixtures

  test "Success 201 - Create Product" do
    payload = CreditLinesV2Fixtures.create_product_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/lending/v2/products"

      sent_body = Jason.decode!(body)
      assert sent_body["name"] == "My Credit Product"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 201,
         body: CreditLinesV2Fixtures.create_product_response()
       }}
    end)

    {:ok, response} = CreateProduct.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "lpr-v2-product-id"
  end
end
