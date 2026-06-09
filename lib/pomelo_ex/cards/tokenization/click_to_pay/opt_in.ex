defmodule PomeloEx.Cards.Tokenization.ClickToPay.OptIn do
  @moduledoc false

  alias PomeloEx.Types.Cards.Tokenization.ClickToPay.OptInType

  def execute(%OptInType{token: token, card_id: card_id} = payload) do
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Map.delete(:card_id)
      |> Enum.reject(fn {_, v} -> v == nil end)
      |> Enum.into(%{})
      |> Jason.encode!()

    PomeloEx.Client.request(:post, "/tokenization/v1/cards/#{card_id}/click-to-pay", body, headers)
  end

  defp build_headers(token) do
    idempotency_key_length = Application.get_env(:pomelo_ex, :idempotency_key_length)

    idempotency_key =
      idempotency_key_length
      |> :crypto.strong_rand_bytes()
      |> Base.encode64(padding: false)
      |> binary_part(0, idempotency_key_length)

    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"},
      {"x-idempotency-key", idempotency_key}
    ]
  end
end
