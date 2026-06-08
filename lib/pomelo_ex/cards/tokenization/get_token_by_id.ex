defmodule PomeloEx.Cards.Tokenization.GetTokenById do
  @moduledoc false

  alias PomeloEx.Types.Cards.Tokenization.GetTokenByIdType

  def execute(%GetTokenByIdType{token: token, external_token_id: external_token_id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/tokenization/v1/tokens/#{external_token_id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
