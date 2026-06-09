defmodule PomeloEx.Loyalty.PointsConfirmationNotification do
  @moduledoc false

  alias PomeloEx.Types.Loyalty.PointsConfirmationNotificationType

  def execute(%PointsConfirmationNotificationType{} = payload) do
    {:ok, payload}
  end
end
