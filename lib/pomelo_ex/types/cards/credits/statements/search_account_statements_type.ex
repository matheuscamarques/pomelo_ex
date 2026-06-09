defmodule PomeloEx.Types.Cards.Credits.Statements.SearchAccountStatementsType do
  @moduledoc false
  use TypedEctoSchema
  @primary_key false

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:credit_line_id, :string, enforce: true, null: false)
    field(:filter_status, :string)
    field(:filter_period_from, :string)
    field(:filter_period_to, :string)
    field(:include, :string)
    field(:page_size, :string)
    field(:page_number, :string)
    field(:sort, :string)
  end
end
