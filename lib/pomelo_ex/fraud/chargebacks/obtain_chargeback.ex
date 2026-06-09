defmodule PomeloEx.Fraud.Chargebacks.ObtainChargeback do
  @moduledoc false

  alias PomeloEx.Types.Fraud.Chargebacks.ObtainChargebackType

  def execute(%ObtainChargebackType{token: token, chargeback_id: chargeback_id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/chargebacks/v2/#{chargeback_id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
