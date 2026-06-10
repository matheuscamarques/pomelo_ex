defmodule PomeloEx.Cards.Tokenization.ClickToPay.OptOut do
  @moduledoc false

  alias PomeloEx.Types.Cards.Tokenization.ClickToPay.OptOutType

  def execute(%OptOutType{token: token, card_id: card_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(
      :delete,
      "/tokenization/v1/cards/#{card_id}/click-to-pay",
      nil,
      headers
    )
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
