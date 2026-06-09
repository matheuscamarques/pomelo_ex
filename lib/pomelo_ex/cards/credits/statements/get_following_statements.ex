defmodule PomeloEx.Cards.Credits.Statements.GetFollowingStatements do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.Statements.GetFollowingStatementsType

  def execute(%GetFollowingStatementsType{token: token, credit_line_id: credit_line_id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/lending/v1/credit-lines/#{credit_line_id}/statements/next", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
