defmodule PomeloEx.Cards.Credits.CreditProduct.GetProduct do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditProduct.GetProductType

  def execute(%GetProductType{token: token, id: id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/lending/v1/products/#{id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
