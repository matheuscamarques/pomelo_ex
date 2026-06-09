defmodule PomeloEx.Cards.Credits.CreditLines.DebtAcceleration do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLines.DebtAccelerationType

  def execute(%DebtAccelerationType{token: token, credit_line_id: credit_line_id} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)

    headers = build_headers(token)

    body = payload.body |> Jason.encode!()

    http_client.post("#{url}/lending/v1/credit-lines/#{credit_line_id}/debt/acceleration", body, headers)
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
