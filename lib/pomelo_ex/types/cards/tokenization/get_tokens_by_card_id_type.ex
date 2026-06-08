defmodule PomeloEx.Types.Cards.Tokenization.GetTokensByCardIdType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:external_card_id, :string, enforce: true, null: false)
    field(:filter_merchant_name, :string)
    field(:filter_token_status, :string)
    field(:filter_token_requestor_id, :string)
    field(:page_size, :integer)
    field(:page_number, :integer)
  end
end
