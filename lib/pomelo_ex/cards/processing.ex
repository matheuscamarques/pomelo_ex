defmodule PomeloEx.Cards.Processing do
  @moduledoc """
  Transaction processing and authorization.

  This namespace groups all transaction processing operations:
  - `PomeloEx.Cards.Processing.OnUs` — On-us (same-issuer) transaction processing
  - `PomeloEx.Cards.Processing.Summaries` — Tax calculation and retrieval for statements
  - `PomeloEx.Cards.Processing.Transactions` — Authorization, adjustments, and notifications
  """
  alias PomeloEx.Cards.Processing.OnUs
  alias PomeloEx.Cards.Processing.Summaries
  alias PomeloEx.Cards.Processing.Transactions

  defdelegate authorize(payload), to: OnUs, as: :authorize
  defdelegate reverse_transaction(payload), to: OnUs, as: :reverse_transaction
  defdelegate reverse_transaction_by_external_id(payload), to: OnUs, as: :reverse_transaction_by_external_id
  defdelegate present_transaction_by_external_id(payload), to: OnUs, as: :present_transaction_by_external_id
  defdelegate present_transaction_by_pomelo_id(payload), to: OnUs, as: :present_transaction_by_pomelo_id
  defdelegate authorize_transaction(payload), to: Transactions, as: :authorize_transaction
  defdelegate adjustments(payload), to: Transactions, as: :adjustments
  defdelegate notifications(payload), to: Transactions, as: :notifications
  defdelegate presentments_notifications(payload), to: Transactions, as: :presentments_notifications
  defdelegate card_shipping_of_otp_codes(payload), to: Transactions, as: :card_shipping_of_otp_codes
  defdelegate calculate_taxes(payload), to: Summaries, as: :calculate_taxes
  defdelegate retrieve_taxes(payload), to: Summaries, as: :retrieve_taxes
end
