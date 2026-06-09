defmodule PomeloEx.Types.Cards.Processing.Summaries.RetrieveTaxesType do
  @moduledoc false
  use TypedEctoSchema

  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:statement_id, :string, enforce: true, null: false)
  end
end
