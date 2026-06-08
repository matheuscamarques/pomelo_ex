defmodule PomeloEx.Cards.Processing.Transactions.NotificationsTest do
  use ExUnit.Case

  alias PomeloEx.Cards.Processing.Transactions.Notifications
  alias PomeloEx.Cards.ProcessingTransactionsFixtures

  test "Success - Notifications" do
    payload = ProcessingTransactionsFixtures.notifications_request()

    assert {:ok, response} = Notifications.execute(payload)
    assert response == payload
  end
end
