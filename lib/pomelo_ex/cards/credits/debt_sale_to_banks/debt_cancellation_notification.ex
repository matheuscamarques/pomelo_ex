defmodule PomeloEx.Cards.Credits.DebtSaleToBanks.DebtCancellationNotification do
  @moduledoc """
  Webhook handler for debt cancellation events.

  Configure your endpoint at `POST https://<your-server>/debts` to receive notifications
  when a debt is cancelled due to account closure.

  The payload includes details of paid, discounted, and pending amounts at the time of cancellation.
  """

  @doc """
  Process a debt cancellation notification.

  Returns `{:ok, %{status: 200}}` on success.
  """
  def execute(_payload) do
    {:ok, %{status: 200}}
  end
end
