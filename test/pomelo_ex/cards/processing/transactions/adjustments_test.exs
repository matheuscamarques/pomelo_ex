defmodule PomeloEx.Cards.Processing.Transactions.AdjustmentsTest do
  use ExUnit.Case

  alias PomeloEx.Cards.Processing.Transactions.Adjustments
  alias PomeloEx.Cards.ProcessingTransactionsFixtures

  test "Success - Adjustments" do
    payload = ProcessingTransactionsFixtures.adjustments_request()

    assert {:ok, response} = Adjustments.execute(payload)
    assert response == payload
  end
end
