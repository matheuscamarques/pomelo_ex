defmodule PomeloEx.Cards.Credits.CreditProduct.CreateProductTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditProduct.CreateProduct
  alias PomeloEx.Cards.Credits.CreditProductFixtures

  test "Success 201 - Create Product" do
    payload = CreditProductFixtures.create_product_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/lending/v1/products"

      sent_body = Jason.decode!(body)
      assert sent_body["cutoff_day"] == 15

      {:ok,
       %HTTPoison.Response{
         status_code: 201,
         body: CreditProductFixtures.create_product_response()
       }}
    end)

    {:ok, response} = CreateProduct.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "lpr-2HMvSzWjc5La6WDTlgFweXAmPle"
    assert body["data"]["status"] == "ACTIVE"
  end
end
