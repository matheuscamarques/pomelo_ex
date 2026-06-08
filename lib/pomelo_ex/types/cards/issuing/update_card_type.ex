defmodule PomeloEx.Types.Cards.Issuing.UpdateCardType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:id, :string, enforce: true, null: false)
    field(:status, :string)
    field(:status_reason, :string)
  end
end
