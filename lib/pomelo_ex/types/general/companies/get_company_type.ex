defmodule PomeloEx.Types.General.Companies.GetCompanyType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
  end
end
