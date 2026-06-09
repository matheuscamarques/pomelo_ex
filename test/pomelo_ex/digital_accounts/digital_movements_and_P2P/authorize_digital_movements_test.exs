defmodule PomeloEx.DigitalAccounts.DigitalMovementsAndP2P.AuthorizeDigitalMovementsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.DigitalAccounts.DigitalMovementsAndP2P.AuthorizeDigitalMovements
  alias PomeloEx.DigitalAccounts.DigitalMovementsAndP2PFixtures

  test "Success 201 - Authorize Digital Movements" do
    payload = DigitalMovementsAndP2PFixtures.authorize_digital_movements_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/core/transactions/v1"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 201,
         body: DigitalMovementsAndP2PFixtures.authorize_digital_movements_response()
       }}
    end)

    {:ok, response} = AuthorizeDigitalMovements.execute(payload)

    body = Jason.decode!(response.body)
    assert body["result"] == "REJECTED"
    assert body["rejection_reason"] == "INSUFFICIENT_FUNDS"
  end
end
