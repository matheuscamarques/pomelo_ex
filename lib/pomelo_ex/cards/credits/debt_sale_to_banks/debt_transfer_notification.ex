defmodule PomeloEx.Cards.Credits.DebtSaleToBanks.DebtTransferNotification do
  @moduledoc """
  Webhook handler for debt transfer events.

  Configure your endpoint at `POST https://<your-server>/debts` to receive notifications
  when a debt is transferred to another debt, either due to expiration
  (`debt_state: DUE_DEBT`) or refinancing (`debt_state: REFINANCED`).

  The `replaced_by_debt_id` field indicates the new debt that absorbs the pending balance.
  """

  @doc """
  Process a debt transfer notification.

  Returns `{:ok, %{status: 200}}` on success.
  """
  def execute(_payload) do
    {:ok, %{status: 200}}
  end
end
