defmodule PomeloEx.Types.Finance.Settlements.NotifyDepositType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:file, :string, enforce: true, null: false)
    field(:country, :string, enforce: true, null: false)
    field(:currency_name, :string, enforce: true, null: false)
    field(:origin, :string)
    field(:amount, :decimal, enforce: true, null: false)
  end
end
