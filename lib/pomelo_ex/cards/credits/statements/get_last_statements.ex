defmodule PomeloEx.Cards.Credits.Statements.GetLastStatements do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.Statements.GetLastStatementsType

  def execute(%GetLastStatementsType{token: token, credit_line_id: credit_line_id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/lending/v1/credit-lines/#{credit_line_id}/statements/last", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
