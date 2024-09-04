defmodule PomeloEx.Types.General.Users.SearchUserType do
  @moduledoc false
  use TypedEctoSchema

  @primary_key false
  typed_embedded_schema do
    field(:filter_identification_value, :string)
    field(:filter_identification_type, :string)
    field(:filter_tax_identification_type, :string)
    field(:filter_tax_identification_value, :string)
    field(:filter_gender, :string)
    field(:filter_birthdate, :string)
    field(:filter_name, :string)
    field(:filter_surname, :string)
    field(:filter_email, :string)
    field(:filter_status, :string)
    field(:filter_country_code, :string)
    field(:filter_company_id, :binary_id)
    field(:filter_tax_condition, :string)
    field(:page_size, :integer)
    field(:page_number, :integer)
    field(:sort, {:array, :string})
  end
end
