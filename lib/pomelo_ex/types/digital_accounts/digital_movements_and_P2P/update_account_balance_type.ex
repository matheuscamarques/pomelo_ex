defmodule PomeloEx.Types.DigitalAccounts.DigitalMovementsAndP2P.UpdateAccountBalanceType do
  @moduledoc false
  use TypedEctoSchema

  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:account_id, :string, enforce: true, null: false)
    field(:balance, :string, enforce: true, null: false)
  end
end
