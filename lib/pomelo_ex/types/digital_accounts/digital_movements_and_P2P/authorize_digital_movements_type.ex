defmodule PomeloEx.Types.DigitalAccounts.DigitalMovementsAndP2P.AuthorizeDigitalMovementsType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:account_id, :string, enforce: true, null: false)
    field(:type, :string, enforce: true, null: false)
    field(:process_type, :string, enforce: true, null: false)
    field(:parent_tx_id, :string)
    field(:data, :map, enforce: true, null: false)
    field(:entry_type, :string, enforce: true, null: false)
    field(:total_amount, :string, enforce: true, null: false)
    field(:process_before, :string)
    field(:accounts_id, {:array, :string})
    field(:client_id, :string)
    field(:local, :map)
    field(:settlement, :map)
    field(:transaction, :map)
  end
end
