defmodule PomeloEx.Cards.Credits.CreditLines.DebtSimulation do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLines.DebtSimulationType

  def execute(%DebtSimulationType{token: token, credit_line_id: credit_line_id, transaction_ids: transaction_ids})
      when not is_nil(transaction_ids) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get,
      "/lending/v1/credit-lines/#{credit_line_id}/debt/simulation/?transaction_ids=#{transaction_ids}",
      nil,
      headers
    )
  end

  def execute(%DebtSimulationType{token: token, credit_line_id: credit_line_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/lending/v1/credit-lines/#{credit_line_id}/debt/simulation", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
