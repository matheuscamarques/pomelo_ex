defmodule PomeloEx.Loyalty.PointsCancellationNotification do
  @moduledoc false

  alias PomeloEx.Types.Loyalty.PointsCancellationNotificationType

  def execute(%PointsCancellationNotificationType{} = payload) do
    {:ok, payload}
  end
end
