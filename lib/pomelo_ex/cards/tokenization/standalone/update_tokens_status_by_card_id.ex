defmodule PomeloEx.Cards.Tokenization.Standalone.UpdateTokensStatusByCardId do
  @moduledoc false

  alias PomeloEx.Types.Cards.Tokenization.Standalone.UpdateTokensStatusByCardIdType

  def execute(%UpdateTokensStatusByCardIdType{token: token, card_id: card_id} = payload) do
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Map.delete(:card_id)
      |> Enum.reject(fn {_, v} -> v == nil end)
      |> Enum.into(%{})
      |> Jason.encode!()

    PomeloEx.Client.request(:patch, "/tokenization/v1/tokens/cards/#{card_id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
