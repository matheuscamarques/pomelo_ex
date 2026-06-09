defmodule PomeloEx.Fraud.Chargebacks.ObtainChargeback do
  @moduledoc false

  alias PomeloEx.Types.Fraud.Chargebacks.ObtainChargebackType

  def execute(%ObtainChargebackType{token: token, chargeback_id: chargeback_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/chargebacks/v2/#{chargeback_id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
