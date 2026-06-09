defmodule PomeloEx.Cards.Processing.Summaries.RetrieveTaxes do
  @moduledoc false

  alias PomeloEx.Types.Cards.Processing.Summaries.RetrieveTaxesType

  def execute(%RetrieveTaxesType{token: token, statement_id: statement_id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/taxes/v1/statements/#{statement_id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
