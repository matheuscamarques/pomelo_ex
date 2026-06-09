defmodule PomeloEx.Types.Finance.Settlements.NewSettlementType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:event_id, :string, enforce: true, null: false)
    field(:idempotency_key, :string, enforce: true, null: false)
    field(:settlement_id, :string, enforce: true, null: false)
    field(:settlement_status, :string, enforce: true, null: false)
    field(:settlement_date, :string, enforce: true, null: false)
    field(:country, :string, enforce: true, null: false)
  end
end
