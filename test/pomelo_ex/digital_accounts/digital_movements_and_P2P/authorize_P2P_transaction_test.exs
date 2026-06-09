defmodule PomeloEx.DigitalAccounts.DigitalMovementsAndP2P.AuthorizeP2PTransactionTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.DigitalAccounts.DigitalMovementsAndP2P.AuthorizeP2PTransaction
  alias PomeloEx.DigitalAccounts.DigitalMovementsAndP2PFixtures

  test "Success 201 - Authorize P2P Transaction" do
    payload = DigitalMovementsAndP2PFixtures.authorize_P2P_transaction_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/core/transactions/v1/p2p"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 201,
         body: DigitalMovementsAndP2PFixtures.authorize_P2P_transaction_response()
       }}
    end)

    {:ok, response} = AuthorizeP2PTransaction.execute(payload)

    body = Jason.decode!(response.body)
    assert body["source_account_tx"]["result"] == "REJECTED"
  end
end
