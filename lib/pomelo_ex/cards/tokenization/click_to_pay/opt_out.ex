defmodule PomeloEx.Cards.Tokenization.ClickToPay.OptOut do
  @moduledoc false

  alias PomeloEx.Types.Cards.Tokenization.ClickToPay.OptOutType

  def execute(%OptOutType{token: token, card_id: card_id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.delete("#{url}/tokenization/v1/cards/#{card_id}/click-to-pay", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
