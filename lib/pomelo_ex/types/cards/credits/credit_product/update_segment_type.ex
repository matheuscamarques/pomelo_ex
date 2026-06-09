defmodule PomeloEx.Types.Cards.Credits.CreditProduct.UpdateSegmentType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:product_id, :string, enforce: true, null: false)
    field(:segment_id, :string, enforce: true, null: false)
    field(:body, :map, enforce: true, null: false)
  end
end
