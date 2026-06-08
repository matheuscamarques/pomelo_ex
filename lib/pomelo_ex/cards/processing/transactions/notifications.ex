defmodule PomeloEx.Cards.Processing.Transactions.Notifications do
  @moduledoc false

  alias PomeloEx.Types.Cards.Processing.Transactions.NotificationsType

  def execute(%NotificationsType{} = payload) do
    {:ok, payload}
  end
end
