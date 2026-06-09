defmodule PomeloEx.Types.Finance.Settlements.GetLastSettlementType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:country, :string, enforce: true, null: false)
  end
end
