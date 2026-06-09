defmodule PomeloEx.Cards.Tokenization.GetTokenById do
  @moduledoc false

  alias PomeloEx.Types.Cards.Tokenization.GetTokenByIdType

  def execute(%GetTokenByIdType{token: token, external_token_id: external_token_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/tokenization/v1/tokens/#{external_token_id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
