defmodule PomeloEx.Cards.Processing.OnUs.AuthorizeTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.OnUsFixtures
  alias PomeloEx.Cards.Processing.OnUs.Authorize

  test "Success 200 - Authorize transaction" do
    payload = OnUsFixtures.authorize_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/on-us/v1/transactions/authorize"

      decoded_body = Jason.decode!(body)
      assert decoded_body["transaction"] == payload.transaction
      assert decoded_body["pos"] == payload.pos

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: OnUsFixtures.on_us_success_response()
       }}
    end)

    {:ok, response} = Authorize.execute(payload)

    body = Jason.decode!(response.body)
    assert body["status"] == "APPROVED"
  end
end
