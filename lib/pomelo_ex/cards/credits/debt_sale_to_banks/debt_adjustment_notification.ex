defmodule PomeloEx.Cards.Credits.DebtSaleToBanks.DebtAdjustmentNotification do
  @moduledoc """
  Webhook handler for debt adjustment events.

  Configure your endpoint at `POST https://<your-server>/debts` to receive notifications
  when adjustments are made to a debt, such as discounts on interest, principal, or taxes.

  The `adjustment_details` field in the payload indicates the adjusted amounts and,
  when applicable, the new billing cycle dates.
  """

  @doc """
  Process a debt adjustment notification.

  Returns `{:ok, %{status: 200}}` on success.
  """
  def execute(_payload) do
    {:ok, %{status: 200}}
  end
end
