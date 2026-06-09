defmodule PomeloEx.Cards.Processing.OnUs.PresentTransactionByPomeloIdTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.OnUsFixtures
  alias PomeloEx.Cards.Processing.OnUs.PresentTransactionByPomeloId

  test "Success 200 - Present transaction by pomelo ID" do
    payload = OnUsFixtures.present_transaction_by_pomelo_id_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <> "/on-us/v1/presentments/pres-123/reverse"

      decoded_body = Jason.decode!(body)
      assert decoded_body["external_presentment_id"] == payload.external_presentment_id
      assert decoded_body["reconciliation_date"] == payload.reconciliation_date

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: OnUsFixtures.on_us_success_response()
       }}
    end)

    {:ok, response} = PresentTransactionByPomeloId.execute(payload)

    body = Jason.decode!(response.body)
    assert body["status"] == "APPROVED"
  end
end
