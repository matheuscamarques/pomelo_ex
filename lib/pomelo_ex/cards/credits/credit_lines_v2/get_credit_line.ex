defmodule PomeloEx.Cards.Credits.CreditLinesV2.GetCreditLine do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.GetCreditLineType

  def execute(%GetCreditLineType{token: token, id: id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/lending/v2/credit-lines/#{id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
