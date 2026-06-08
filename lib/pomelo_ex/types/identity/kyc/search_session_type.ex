defmodule PomeloEx.Types.Identity.KYC.SearchSessionType do
  @moduledoc false
  use TypedEctoSchema

  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:filter_status, :string)
    field(:filter_created_at_from, :string)
    field(:filter_created_at_to, :string)
    field(:page_size, :integer)
    field(:page_number, :integer)
    field(:sort, {:array, :string})
  end
end
