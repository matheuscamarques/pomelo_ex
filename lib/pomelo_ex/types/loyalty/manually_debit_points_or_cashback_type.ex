defmodule PomeloEx.Types.Loyalty.ManuallyDebitPointsOrCashbackType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:account_type, :string, enforce: true, null: false)
    field(:amount, :decimal, enforce: true, null: false)
    field(:reason, :string, enforce: true, null: false)
    field(:card_id, :string, enforce: true, null: false)
  end
end
