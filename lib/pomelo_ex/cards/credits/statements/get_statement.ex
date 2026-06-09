defmodule PomeloEx.Cards.Credits.Statements.GetStatement do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.Statements.GetStatementType

  def execute(%GetStatementType{token: token, credit_line_id: credit_line_id, id: id} = payload) do
    headers = build_headers(token)

    url = "/lending/v1/credit-lines/#{credit_line_id}/statements/#{id}"

    url =
      case payload.extended do
        nil -> url
        extended -> url <> "/?extended=#{extended}"
      end

    PomeloEx.Client.request(:get, url, nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
