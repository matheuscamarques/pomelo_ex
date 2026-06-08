defmodule PomeloEx.Types.Cards.Tokenization.ClickToPay.GetStatusType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:card_id, :string, enforce: true, null: false)
  end
end
