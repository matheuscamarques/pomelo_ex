defmodule PomeloEx.Cards.Tokenization.Standalone.UpdateTokensStatusByCardId do
  @moduledoc false

  alias PomeloEx.Types.Cards.Tokenization.Standalone.UpdateTokensStatusByCardIdType

  def execute(%UpdateTokensStatusByCardIdType{token: token, card_id: card_id} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Map.delete(:card_id)
      |> Enum.reject(fn {_, v} -> v == nil end)
      |> Enum.into(%{})
      |> Jason.encode!()

    http_client.patch("#{url}/tokenization/v1/tokens/cards/#{card_id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
