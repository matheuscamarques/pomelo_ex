defmodule PomeloEx.Cards.Credits.DebtSaleToBanks.DebtCreationNotification do
  @moduledoc """
  Webhook handler for debt creation events.

  Configure your endpoint at `POST https://<your-server>/debts` to receive notifications
  when debts are created. Includes debt types: CURRENT_CYCLE_CHARGES, REVOLVING,
  MANDATORY_REFINANCING, and MANUAL_REFINANCING.

  The payload content depends on the debt type: financed debts include installments,
  rates, and composition; current cycle debts only include amounts and dates.
  """

  @doc """
  Process a debt creation notification.

  Returns `{:ok, %{status: 200}}` on success.
  """
  def execute(_payload) do
    {:ok, %{status: 200}}
  end
end
