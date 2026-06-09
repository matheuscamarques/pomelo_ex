defmodule PomeloEx.Cards.Tokenization.ClickToPay.GetStatus do
  @moduledoc false

  alias PomeloEx.Types.Cards.Tokenization.ClickToPay.GetStatusType

  def execute(%GetStatusType{token: token, card_id: card_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/tokenization/v1/cards/#{card_id}/click-to-pay", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
