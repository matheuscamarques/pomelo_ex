defmodule PomeloEx.Cards.Issuing.Shipments.ShipmentNotifications do
  @moduledoc false

  alias PomeloEx.Types.Cards.Issuing.ShipmentNotificationsType

  def execute(%ShipmentNotificationsType{} = payload) do
    {:ok, payload}
  end
end
