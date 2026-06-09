defmodule PomeloEx.Types.DigitalAccounts.Accounts.CreateAccountType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:owner_type, :string, enforce: true, null: false)
    field(:user_id, :string)
    field(:company_id, :string)
    field(:country, :string, enforce: true, null: false)
    field(:currency, :string, enforce: true, null: false)
    field(:metadata, :map)
  end
end
