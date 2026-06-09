defmodule PomeloEx.Types.Cards.Credits.CreditLines.ConfirmTotalDebtAccelerationType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:credit_line_id, :string, enforce: true, null: false)
    field(:body, :map, enforce: true, null: false)
  end
end
