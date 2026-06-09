defmodule PomeloEx.Cards.Credits.Statements.GetStatement do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.Statements.GetStatementType

  def execute(%GetStatementType{token: token, credit_line_id: credit_line_id, id: id} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    url = "#{url}/lending/v1/credit-lines/#{credit_line_id}/statements/#{id}"

    url =
      case payload.extended do
        nil -> url
        extended -> url <> "/?extended=#{extended}"
      end

    http_client.get(url, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
