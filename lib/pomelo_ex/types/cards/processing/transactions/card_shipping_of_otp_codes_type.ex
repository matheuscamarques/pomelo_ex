defmodule PomeloEx.Types.Cards.Processing.Transactions.CardShippingOfOtpCodesType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:event_id, :string)
    field(:idempotency_key, :string)
    field(:otp, :string)
    field(:card_id, :string)
    field(:username, :string)
    field(:email, :string)
    field(:phone, :string)
    field(:merchant_name, :string)
    field(:transaction_amount, :string)
    field(:transaction_currency, :string)
  end
end
