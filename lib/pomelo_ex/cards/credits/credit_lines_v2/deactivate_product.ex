defmodule PomeloEx.Cards.Credits.CreditLinesV2.DeactivateProduct do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.DeactivateProductType

  def execute(%DeactivateProductType{token: token, id: id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.delete("#{url}/lending/v2/products/#{id}", "", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
