defmodule PomeloEx.Types.Cards.Credits.AvailablePlans.GetRefinancingPlansType do
  @moduledoc false
  use TypedEctoSchema
  @primary_key false

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:credit_line_id, :string, enforce: true, null: false)
    field(:filter_status, :string)
    field(:filter_installment_status, :string)
    field(:filter_refinancing_id, :string)
    field(:page_number, :integer, enforce: true, null: false)
    field(:page_size, :integer, enforce: true, null: false)
  end
end
