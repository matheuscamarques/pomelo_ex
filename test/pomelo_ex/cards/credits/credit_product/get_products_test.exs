defmodule PomeloEx.Cards.Credits.CreditProduct.GetProductsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditProduct.GetProducts
  alias PomeloEx.Cards.Credits.CreditProductFixtures

  test "Success 200 - Get Products" do
    payload = CreditProductFixtures.get_products_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/products/?filter.status=ACTIVE"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditProductFixtures.get_products_response()
       }}
    end)

    {:ok, response} = GetProducts.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"] |> List.first() |> Map.get("id") == "lpr-2HMvSzWjc5La6WDTlgFweXAmPle"
  end
end
