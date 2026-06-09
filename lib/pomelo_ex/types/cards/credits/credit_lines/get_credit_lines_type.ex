defmodule PomeloEx.Types.Cards.Credits.CreditLines.GetCreditLinesType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:filter_id, :string)
    field(:filter_user_id, :string)
    field(:filter_status, :string)
    field(:filter_offer_start_date_from, :string)
    field(:filter_offer_start_date_to, :string)
    field(:filter_activation_date_from, :string)
    field(:filter_activation_date_to, :string)
    field(:filter_user_scoring, :string)
  end
end
