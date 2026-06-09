defmodule PomeloEx.Types.Cards.Credits.CreditProduct.ModifyPendingPriceUpdateType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:product_id, :string, enforce: true, null: false)
    field(:start_date, :string, enforce: true, null: false)
    field(:body, :map, enforce: true, null: false)
  end
end
