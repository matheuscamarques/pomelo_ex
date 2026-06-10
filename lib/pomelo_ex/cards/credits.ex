defmodule PomeloEx.Cards.Credits do
  @moduledoc """
  Credit products, lines, and lending management.

  This namespace groups all credit-related operations including product definition,
  credit line management, allocations, installment plans, statements, and debt management.

  ## Sub-modules

  - `PomeloEx.Cards.Credits.CreditProduct` — Credit product configuration (V1)
  - `PomeloEx.Cards.Credits.CreditLines` — Credit line management (V1)
  - `PomeloEx.Cards.Credits.CreditLinesV2` — Credit line management (V2)
  - `PomeloEx.Cards.Credits.AvailablePlans` — Installment and refinancing plan queries
  - `PomeloEx.Cards.Credits.Allocations` — Fund allocation management
  - `PomeloEx.Cards.Credits.Statements` — Account statement queries
  - `PomeloEx.Cards.Credits.Operations` — Credit operations history
  - `PomeloEx.Cards.Credits.Hierarchies` — Organizational hierarchy management
  - `PomeloEx.Cards.Credits.DebtSaleToBanks` — Debt sale/purchase notifications
  - `PomeloEx.Cards.Credits.Webhooks` — Credit webhook notifications
  """
  alias PomeloEx.Cards.Credits.Allocations
  alias PomeloEx.Cards.Credits.AvailablePlans
  alias PomeloEx.Cards.Credits.CreditLines
  alias PomeloEx.Cards.Credits.CreditLinesV2
  alias PomeloEx.Cards.Credits.CreditProduct
  alias PomeloEx.Cards.Credits.DebtSaleToBanks
  alias PomeloEx.Cards.Credits.Hierarchies
  alias PomeloEx.Cards.Credits.Operations
  alias PomeloEx.Cards.Credits.Statements
  alias PomeloEx.Cards.Credits.Webhooks

  defdelegate create_product(payload), to: CreditProduct, as: :create_product
  defdelegate get_products(payload), to: CreditProduct, as: :get_products
  defdelegate get_product(payload), to: CreditProduct, as: :get_product
  defdelegate update_product(payload), to: CreditProduct, as: :update_product
  defdelegate deactivating_product(payload), to: CreditProduct, as: :deactivating_product
  defdelegate create_price_update(payload), to: CreditProduct, as: :create_price_update
  defdelegate get_price_update_history(payload), to: CreditProduct, as: :get_price_update_history

  defdelegate modify_pending_price_update(payload),
    to: CreditProduct,
    as: :modify_pending_price_update

  defdelegate create_segment(payload), to: CreditProduct, as: :create_segment
  defdelegate get_segments(payload), to: CreditProduct, as: :get_segments
  defdelegate get_segment(payload), to: CreditProduct, as: :get_segment
  defdelegate update_segment(payload), to: CreditProduct, as: :update_segment
  defdelegate get_segment_rate_updates(payload), to: CreditProduct, as: :get_segment_rate_updates
  defdelegate get_credit_lines(payload), to: CreditLines, as: :get_credit_lines
  defdelegate create_credit_line(payload), to: CreditLines, as: :create_credit_line
  defdelegate get_credit_line(payload), to: CreditLines, as: :get_credit_line
  defdelegate update_credit_line(payload), to: CreditLines, as: :update_credit_line
  defdelegate cancel_credit_line(payload), to: CreditLines, as: :cancel_credit_line

  defdelegate simulate_expiration_date_update(payload),
    to: CreditLines,
    as: :simulate_expiration_date_update

  defdelegate update_expiration_date(payload), to: CreditLines, as: :update_expiration_date
  defdelegate debt_simulation(payload), to: CreditLines, as: :debt_simulation
  defdelegate debt_acceleration(payload), to: CreditLines, as: :debt_acceleration
  defdelegate simulate_debt_refinancing(payload), to: CreditLines, as: :simulate_debt_refinancing
  defdelegate confirm_debt_refinancing(payload), to: CreditLines, as: :confirm_debt_refinancing

  defdelegate simulate_total_debt_acceleration(payload),
    to: CreditLines,
    as: :simulate_total_debt_acceleration

  defdelegate confirm_total_debt_acceleration(payload),
    to: CreditLines,
    as: :confirm_total_debt_acceleration

  defdelegate simulate_acceleration_of_specific_installments(payload),
    to: CreditLines,
    as: :simulate_acceleration_of_specific_installments

  defdelegate confirm_acceleration_of_debt_for_specific_installments(payload),
    to: CreditLines,
    as: :confirm_acceleration_of_debt_for_specific_installments

  defdelegate create_product_v2(payload), to: CreditLinesV2, as: :create_product
  defdelegate get_products_v2(payload), to: CreditLinesV2, as: :get_products
  defdelegate get_product_v2(payload), to: CreditLinesV2, as: :get_product
  defdelegate update_product_v2(payload), to: CreditLinesV2, as: :update_product
  defdelegate deactivate_product_v2(payload), to: CreditLinesV2, as: :deactivate_product
  defdelegate create_pricing(payload), to: CreditLinesV2, as: :create_pricing
  defdelegate modify_pricing(payload), to: CreditLinesV2, as: :modify_pricing
  defdelegate create_segment_v2(payload), to: CreditLinesV2, as: :create_segment
  defdelegate get_segments_v2(payload), to: CreditLinesV2, as: :get_segments
  defdelegate get_segment_v2(payload), to: CreditLinesV2, as: :get_segment
  defdelegate update_segment_v2(payload), to: CreditLinesV2, as: :update_segment
  defdelegate create_credit_line_v2(payload), to: CreditLinesV2, as: :create_credit_line
  defdelegate get_credit_line_v2(payload), to: CreditLinesV2, as: :get_credit_line
  defdelegate update_credit_line_v2(payload), to: CreditLinesV2, as: :update_credit_line
  defdelegate cancel_credit_line_v2(payload), to: CreditLinesV2, as: :cancel_credit_line
  defdelegate get_installment_plans(payload), to: AvailablePlans, as: :get_installment_plans
  defdelegate get_refinancing_plans(payload), to: AvailablePlans, as: :get_refinancing_plans
  defdelegate generate_allocation(payload), to: Allocations, as: :generate_allocation
  defdelegate obtain_allocation(payload), to: Allocations, as: :obtain_allocation
  defdelegate obtain_allocations(payload), to: Allocations, as: :obtain_allocations
  defdelegate update_ticket(payload), to: Allocations, as: :update_ticket
  defdelegate cancel_allocation(payload), to: Allocations, as: :cancel_allocation
  defdelegate get_statement(payload), to: Statements, as: :get_statement
  defdelegate search_account_statements(payload), to: Statements, as: :search_account_statements
  defdelegate get_last_statements(payload), to: Statements, as: :get_last_statements
  defdelegate get_following_statements(payload), to: Statements, as: :get_following_statements
  defdelegate get_operations(payload), to: Operations, as: :get_operations
  defdelegate create_node(payload), to: Hierarchies, as: :create_node
  defdelegate get_node(payload), to: Hierarchies, as: :get_node
  defdelegate update_node(payload), to: Hierarchies, as: :update_node

  defdelegate debt_creation_notification(payload),
    to: DebtSaleToBanks,
    as: :debt_creation_notification

  defdelegate debt_payment_notification(payload),
    to: DebtSaleToBanks,
    as: :debt_payment_notification

  defdelegate debt_transfer_notification(payload),
    to: DebtSaleToBanks,
    as: :debt_transfer_notification

  defdelegate debt_adjustment_notification(payload),
    to: DebtSaleToBanks,
    as: :debt_adjustment_notification

  defdelegate debt_cancellation_notification(payload),
    to: DebtSaleToBanks,
    as: :debt_cancellation_notification

  defdelegate processed_transactions_notifications(payload),
    to: Webhooks,
    as: :processed_transactions_notifications

  defdelegate reversed_transactions_notifications(payload),
    to: Webhooks,
    as: :reversed_transactions_notifications

  defdelegate credit_line_pause_unpause_notifications(payload),
    to: Webhooks,
    as: :credit_line_pause_unpause_notifications

  defdelegate entry_exit_from_arrears_user_notifications(payload),
    to: Webhooks,
    as: :entry_exit_from_arrears_user_notifications

  defdelegate created_summaries_notifications(payload),
    to: Webhooks,
    as: :created_summaries_notifications
end
