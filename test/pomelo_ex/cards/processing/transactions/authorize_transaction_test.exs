defmodule PomeloEx.Cards.Processing.Transactions.AuthorizeTransactionTest do
  use ExUnit.Case

  alias PomeloEx.Cards.Processing.Transactions.AuthorizeTransaction
  alias PomeloEx.Cards.ProcessingTransactionsFixtures

  test "Success - Authorize Transaction" do
    payload = ProcessingTransactionsFixtures.authorize_transaction_request()

    assert {:ok, response} = AuthorizeTransaction.execute(payload)
    assert response == payload
  end
end
