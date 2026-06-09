defmodule PomeloEx.Fraud.Chargebacks.CreateChargeback do
  @moduledoc false

  alias PomeloEx.Types.Fraud.Chargebacks.CreateChargebackType

  def execute(%CreateChargebackType{token: token, body: body}) do
    headers = build_headers(token)

    body = body |> Jason.encode!()

    PomeloEx.Client.request(:post, "/chargebacks/v2", body, headers)
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
