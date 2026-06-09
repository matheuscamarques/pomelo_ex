defmodule PomeloEx.Types.DigitalAccounts.Accounts.UpdateAccountStatusType do
  @moduledoc false
  use TypedEctoSchema

  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:id, :string, enforce: true, null: false)
    field(:status, :string, enforce: true, null: false)
    field(:status_update_motive, :string)
    field(:status_update_comment, :string)
  end
end
