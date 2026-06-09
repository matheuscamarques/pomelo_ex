defmodule PomeloEx.Types.Loyalty.GetAccountBalanceType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:card_id, :string)
    field(:user_id, :string)
  end
end
