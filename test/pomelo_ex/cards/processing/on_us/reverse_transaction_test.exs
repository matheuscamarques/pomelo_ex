defmodule PomeloEx.Cards.Processing.OnUs.ReverseTransactionTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.OnUsFixtures
  alias PomeloEx.Cards.Processing.OnUs.ReverseTransaction

  test "Success 200 - Reverse transaction" do
    payload = OnUsFixtures.reverse_transaction_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <> "/on-us/v1/transactions/ctx-123/reverse"

      decoded_body = Jason.decode!(body)
      assert decoded_body["transaction"] == payload.transaction

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: OnUsFixtures.on_us_success_response()
       }}
    end)

    {:ok, response} = ReverseTransaction.execute(payload)

    body = Jason.decode!(response.body)
    assert body["status"] == "APPROVED"
  end
end
