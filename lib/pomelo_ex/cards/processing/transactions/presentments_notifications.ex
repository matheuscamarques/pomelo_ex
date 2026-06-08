defmodule PomeloEx.Cards.Processing.Transactions.PresentmentsNotifications do
  @moduledoc false

  alias PomeloEx.Types.Cards.Processing.Transactions.PresentmentsNotificationsType

  def execute(%PresentmentsNotificationsType{} = payload) do
    {:ok, payload}
  end
end
