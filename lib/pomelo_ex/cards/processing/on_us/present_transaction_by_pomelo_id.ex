defmodule PomeloEx.Cards.Processing.OnUs.PresentTransactionByPomeloId do
  @moduledoc false

  alias PomeloEx.Types.Cards.Processing.OnUs.PresentTransactionByPomeloIdType

  def execute(
        %PresentTransactionByPomeloIdType{
          token: token,
          original_presentment_id: original_presentment_id
        } = payload
      ) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Map.delete(:original_presentment_id)
      |> Enum.reject(fn {_, v} -> v == nil end)
      |> Enum.into(%{})
      |> Jason.encode!()

    http_client.post(
      "#{url}/on-us/v1/presentments/#{original_presentment_id}/reverse",
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
