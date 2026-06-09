defmodule PomeloEx.Types.DigitalAccounts.DigitalMovementsAndP2P.AuthorizeP2PTransactionType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:source_account_id, :string, enforce: true, null: false)
    field(:destination_account_id, :string, enforce: true, null: false)
    field(:source_data, :map, enforce: true, null: false)
    field(:destination_data, :map, enforce: true, null: false)
    field(:total_amount, :string, enforce: true, null: false)
    field(:process_before, :string)
  end
end
