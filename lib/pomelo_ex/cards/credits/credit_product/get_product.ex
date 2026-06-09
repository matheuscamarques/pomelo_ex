defmodule PomeloEx.Cards.Credits.CreditProduct.GetProduct do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditProduct.GetProductType

  def execute(%GetProductType{token: token, id: id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/lending/v1/products/#{id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
