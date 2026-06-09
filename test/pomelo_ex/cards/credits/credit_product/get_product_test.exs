defmodule PomeloEx.Cards.Credits.CreditProduct.GetProductTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditProduct.GetProduct
  alias PomeloEx.Cards.Credits.CreditProductFixtures

  test "Success 200 - Get Product" do
    payload = CreditProductFixtures.get_product_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/products/lpr-2HMvSzWjc5La6WDTlgFweXAmPle"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditProductFixtures.get_product_response()
       }}
    end)

    {:ok, response} = GetProduct.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["status"] == "ACTIVE"
  end
end
