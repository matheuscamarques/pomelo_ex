defmodule PomeloEx.Cards.Credits.CreditProduct.DeactivatingProductTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditProduct.DeactivatingProduct
  alias PomeloEx.Cards.Credits.CreditProductFixtures

  test "Success 200 - Deactivating Product" do
    payload = CreditProductFixtures.deactivating_product_request()

    expect(HTTPMock, :delete, fn url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/products/lpr-2HMvSzWjc5La6WDTlgFweXAmPle"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditProductFixtures.deactivating_product_response()
       }}
    end)

    {:ok, response} = DeactivatingProduct.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["status"] == "INACTIVE"
  end
end
