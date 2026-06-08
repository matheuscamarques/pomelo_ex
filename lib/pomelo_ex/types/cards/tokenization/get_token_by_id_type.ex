defmodule PomeloEx.Types.Cards.Tokenization.GetTokenByIdType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:external_token_id, :string, enforce: true, null: false)
  end
end
