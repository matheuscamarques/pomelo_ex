defmodule PomeloEx.Types.General.Companies.SearchCompaniesType do
  @moduledoc false
  use TypedEctoSchema

  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:filter_tax_identification_type, :string)
    field(:filter_tax_identification_value, :string)
    field(:filter_legal_name, :string)
    field(:filter_trade_name, :string)
    field(:filter_email, :string)
    field(:filter_status, :string)
    field(:filter_country_code, :string)
    field(:filter_type, :string)
    field(:page_size, :integer)
    field(:page_number, :integer)
    field(:sort, {:array, :string})
  end
end
