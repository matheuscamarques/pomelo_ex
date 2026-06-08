defmodule PomeloEx.Cards.Processing.Transactions.PresentmentsNotificationsTest do
  use ExUnit.Case

  alias PomeloEx.Cards.Processing.Transactions.PresentmentsNotifications
  alias PomeloEx.Cards.ProcessingTransactionsFixtures

  test "Success - Presentments Notifications" do
    payload = ProcessingTransactionsFixtures.presentments_notifications_request()

    assert {:ok, response} = PresentmentsNotifications.execute(payload)
    assert response == payload
  end
end
