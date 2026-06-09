defmodule PomeloEx.Cards.Processing.Summaries.RetrieveTaxes do
  @moduledoc false

  alias PomeloEx.Types.Cards.Processing.Summaries.RetrieveTaxesType

  def execute(%RetrieveTaxesType{token: token, statement_id: statement_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/taxes/v1/statements/#{statement_id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
