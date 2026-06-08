defmodule PomeloEx.Types.Identity.KYC.ClearUserTestEnvironmentType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:user_id, :string)
    field(:document_number, :string)
  end
end
