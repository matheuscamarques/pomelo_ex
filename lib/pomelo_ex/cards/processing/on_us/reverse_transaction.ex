defmodule PomeloEx.Cards.Processing.OnUs.ReverseTransaction do
  @moduledoc false

  alias PomeloEx.Types.Cards.Processing.OnUs.ReverseTransactionType

  def execute(
        %ReverseTransactionType{token: token, original_transaction_id: original_transaction_id} =
          payload
      ) do
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Map.delete(:original_transaction_id)
      |> Enum.reject(fn {_, v} -> v == nil end)
      |> Enum.into(%{})
      |> Jason.encode!()

    PomeloEx.Client.request(
      :post,
      "/on-us/v1/transactions/#{original_transaction_id}/reverse",
      body,
      headers
    )
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
