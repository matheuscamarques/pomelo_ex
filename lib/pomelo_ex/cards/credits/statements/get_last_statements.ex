defmodule PomeloEx.Cards.Credits.Statements.GetLastStatements do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.Statements.GetLastStatementsType

  def execute(%GetLastStatementsType{token: token, credit_line_id: credit_line_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/lending/v1/credit-lines/#{credit_line_id}/statements/last", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
