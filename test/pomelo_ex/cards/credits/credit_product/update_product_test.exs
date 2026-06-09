defmodule PomeloEx.Cards.Credits.CreditProduct.UpdateProductTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditProduct.UpdateProduct
  alias PomeloEx.Cards.Credits.CreditProductFixtures

  test "Success 200 - Update Product" do
    payload = CreditProductFixtures.update_product_request()

    expect(HTTPMock, :patch, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/products/lpr-2HMvSzWjc5La6WDTlgFweXAmPle"

      sent_body = Jason.decode!(body)
      assert sent_body["description"] == "Updated product"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditProductFixtures.update_product_response()
       }}
    end)

    {:ok, response} = UpdateProduct.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["description"] == "Updated product"
  end
end
