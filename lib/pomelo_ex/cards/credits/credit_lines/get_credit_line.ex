defmodule PomeloEx.Cards.Credits.CreditLines.GetCreditLine do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLines.GetCreditLineType

  def execute(%GetCreditLineType{token: token, id: id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/lending/v1/credit-lines/#{id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
