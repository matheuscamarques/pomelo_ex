defmodule PomeloEx.Cards.Credits.CreditLines.SimulateTotalDebtAcceleration do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLines.SimulateTotalDebtAccelerationType

  def execute(%SimulateTotalDebtAccelerationType{token: token, credit_line_id: credit_line_id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)

    headers = build_headers(token)

    http_client.post("#{url}/lending/v1/credit-lines/#{credit_line_id}/debt/acceleration/total/simulation", "", headers)
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
