defmodule PomeloEx.Types.Cards.Credits.Statements.GetFollowingStatementsType do
  @moduledoc false
  use TypedEctoSchema
  @primary_key false

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:credit_line_id, :string, enforce: true, null: false)
  end
end
