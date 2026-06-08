defmodule PomeloEx.Types.Cards.Tokenization.Standalone.UpdateTokensStatusByCardIdType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:card_id, :string, enforce: true, null: false)
    field(:status, :string, enforce: true, null: false)
    field(:reason, :string)
  end
end
