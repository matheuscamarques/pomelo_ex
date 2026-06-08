defmodule PomeloEx.Cards.Processing.OnUs.ReverseTransactionByExternalIdTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.OnUsFixtures
  alias PomeloEx.Cards.Processing.OnUs.ReverseTransactionByExternalId

  test "Success 200 - Reverse transaction by external ID" do
    payload = OnUsFixtures.reverse_transaction_by_external_id_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/on-us/v1/transactions/reverse"

      decoded_body = Jason.decode!(body)
      assert decoded_body["transaction"] == payload.transaction

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: OnUsFixtures.on_us_success_response()
       }}
    end)

    {:ok, response} = ReverseTransactionByExternalId.execute(payload)

    body = Jason.decode!(response.body)
    assert body["status"] == "APPROVED"
  end
end
