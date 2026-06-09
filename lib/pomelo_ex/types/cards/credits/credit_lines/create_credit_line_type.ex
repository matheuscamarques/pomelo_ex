defmodule PomeloEx.Types.Cards.Credits.CreditLines.CreateCreditLineType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:user_id, :string, enforce: true, null: false)
    field(:product_id, :string, enforce: true, null: false)
    field(:segment_id, :string)
    field(:limits, :map, enforce: true, null: false)
    field(:offer_start_date, :string, enforce: true, null: false)
    field(:offer_end_date, :string)
    field(:due_date, :integer, enforce: true, null: false)
    field(:user_scoring, :string, enforce: true, null: false)
    field(:person_type, :string)
  end
end
