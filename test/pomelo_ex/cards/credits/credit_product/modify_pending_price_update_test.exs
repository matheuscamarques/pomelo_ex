defmodule PomeloEx.Cards.Credits.CreditProduct.ModifyPendingPriceUpdateTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditProduct.ModifyPendingPriceUpdate
  alias PomeloEx.Cards.Credits.CreditProductFixtures

  test "Success 200 - Modify Pending Price Update" do
    payload = CreditProductFixtures.modify_pending_price_update_request()

    expect(HTTPMock, :patch, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/products/lpr-2HMvSzWjc5La6WDTlgFweXAmPle/pricing/2024-01-15"

      sent_body = Jason.decode!(body)
      assert sent_body["rates"]["financing"] == "17.00"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditProductFixtures.modify_pending_price_update_response()
       }}
    end)

    {:ok, response} = ModifyPendingPriceUpdate.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["rates"]["financing"] == "17.00"
  end
end
