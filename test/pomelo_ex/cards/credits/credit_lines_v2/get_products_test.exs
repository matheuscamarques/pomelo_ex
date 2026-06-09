defmodule PomeloEx.Cards.Credits.CreditLinesV2.GetProductsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLinesV2.GetProducts
  alias PomeloEx.Cards.Credits.CreditLinesV2Fixtures

  test "Success 200 - Get Products" do
    payload = CreditLinesV2Fixtures.get_products_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert String.contains?(url, "/lending/v2/products/")
      assert String.contains?(url, "filter.status=ACTIVE")

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CreditLinesV2Fixtures.get_products_response()
       }}
    end)

    {:ok, response} = GetProducts.execute(payload)

    body = Jason.decode!(response.body)
    assert length(body["data"]) == 1
  end
end
