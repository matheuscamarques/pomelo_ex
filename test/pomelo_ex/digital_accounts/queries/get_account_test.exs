defmodule PomeloEx.DigitalAccounts.Queries.GetAccountTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.DigitalAccounts.Queries.GetAccount
  alias PomeloEx.DigitalAccounts.QueriesFixtures

  test "Success 200 - Get Account" do
    payload = QueriesFixtures.get_account_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/core/accounts/v1/#{payload.id}"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: QueriesFixtures.get_account_response()
       }}
    end)

    {:ok, response} = GetAccount.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.id
    assert body["data"]["balance"] == "982345.12"
  end
end
