defmodule PomeloEx.Types.DigitalAccounts.Queries.ListActivitiesType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:filter_account_id, :string)
    field(:filter_user_id, :string)
    field(:filter_company_id, :string)
    field(:filter_status, {:array, :string})
    field(:filter_currency, :string)
    field(:filter_type, :string)
    field(:filter_created_from, :string)
    field(:filter_created_until, :string)
    field(:filter_updated_from, :string)
    field(:filter_updated_until, :string)
    field(:page_number, :integer)
    field(:page_size, :integer)
    field(:sort, :string)
  end
end
