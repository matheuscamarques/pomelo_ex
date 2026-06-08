defmodule PomeloEx.Cards.Processing.OnUs.PresentTransactionByExternalIdTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.OnUsFixtures
  alias PomeloEx.Cards.Processing.OnUs.PresentTransactionByExternalId

  test "Success 200 - Present transaction by external ID" do
    payload = OnUsFixtures.present_transaction_by_external_id_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/on-us/v1/presentments"

      decoded_body = Jason.decode!(body)
      assert decoded_body["type"] == payload.type
      assert decoded_body["external_presentment_id"] == payload.external_presentment_id
      assert decoded_body["reconciliation_date"] == payload.reconciliation_date

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: OnUsFixtures.on_us_success_response()
       }}
    end)

    {:ok, response} = PresentTransactionByExternalId.execute(payload)

    body = Jason.decode!(response.body)
    assert body["status"] == "APPROVED"
  end
end
