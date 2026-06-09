defmodule PomeloEx.Types.Cards.Tokenization.Visa.ProvisioningApplePayType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:body, :map, enforce: true, null: false)
  end
end
