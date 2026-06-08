defmodule PomeloEx.Types.Identity.KYC.CreateSessionType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:user_id, :string)
    field(:flow_id, :string)
    field(:external_id, :string)
  end
end
