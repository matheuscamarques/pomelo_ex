defmodule PomeloEx.Cards.Credits.CreditProduct.GetProductsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditProduct.GetProducts
  alias PomeloEx.Cards.Credits.CreditProductFixtures

  test "Success 200 - Get Products" do
    payload = CreditProductFixtures.get_products_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/products/?filter.status=ACTIVE"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CreditProductFixtures.get_products_response()
       }}
    end)

    {:ok, response} = GetProducts.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"] |> List.first() |> Map.get("id") == "lpr-2HMvSzWjc5La6WDTlgFweXAmPle"
  end
end
