defmodule PomeloEx.Loyalty.ManuallyCreditPointsOrCashback do
  @moduledoc false

  alias PomeloEx.Types.Loyalty.ManuallyCreditPointsOrCashbackType

  def execute(%ManuallyCreditPointsOrCashbackType{token: token, account_type: account_type} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)

    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.drop([:token, :account_type])
      |> Jason.encode!()

    http_client.post("#{url}/loyalty/v1/accounts/#{account_type}/mint", body, headers)
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
