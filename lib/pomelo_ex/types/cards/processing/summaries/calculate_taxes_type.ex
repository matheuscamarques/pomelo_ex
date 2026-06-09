defmodule PomeloEx.Types.Cards.Processing.Summaries.CalculateTaxesType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:card_id, :string, enforce: true, null: false)
    field(:period, :string, enforce: true, null: false)
  end
end
