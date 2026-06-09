defmodule PomeloEx.Loyalty.PendingPointsNotification do
  @moduledoc false

  alias PomeloEx.Types.Loyalty.PendingPointsNotificationType

  def execute(%PendingPointsNotificationType{} = payload) do
    {:ok, payload}
  end
end
