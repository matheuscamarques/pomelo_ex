defmodule PomeloEx.Types.Cards.Credits.CreditLinesV2.GetSegmentType do
  @moduledoc false
  use TypedEctoSchema
  @primary_key false

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:product_id, :string, enforce: true, null: false)
    field(:segment_id, :string, enforce: true, null: false)
  end
end
