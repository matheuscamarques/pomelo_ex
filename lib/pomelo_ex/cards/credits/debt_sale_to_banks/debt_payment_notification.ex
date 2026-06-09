defmodule PomeloEx.Cards.Credits.DebtSaleToBanks.DebtPaymentNotification do
  @moduledoc """
  Webhook handler for debt payment events.

  Configure your endpoint at `POST https://<your-server>/debts` to receive notifications
  when payments (full or partial) are registered on a debt.

  The `debt_state` field indicates:
  - FULFILLED: the debt was fully paid
  - PARTIALLY_FULFILLED: the debt still has pending balance
  """

  @doc """
  Process a debt payment notification.

  Returns `{:ok, %{status: 200}}` on success.
  """
  def execute(_payload) do
    {:ok, %{status: 200}}
  end
end
