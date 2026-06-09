defmodule PomeloEx.Cards.Credits.CreditLines.DebtSimulation do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLines.DebtSimulationType

  def execute(%DebtSimulationType{token: token, credit_line_id: credit_line_id, transaction_ids: transaction_ids})
      when not is_nil(transaction_ids) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get(
      "#{url}/lending/v1/credit-lines/#{credit_line_id}/debt/simulation/?transaction_ids=#{transaction_ids}",
      headers
    )
  end

  def execute(%DebtSimulationType{token: token, credit_line_id: credit_line_id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/lending/v1/credit-lines/#{credit_line_id}/debt/simulation", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
