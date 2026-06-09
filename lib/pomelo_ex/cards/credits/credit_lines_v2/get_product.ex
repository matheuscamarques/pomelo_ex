defmodule PomeloEx.Cards.Credits.CreditLinesV2.GetProduct do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.GetProductType

  def execute(%GetProductType{token: token, id: id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/lending/v2/products/#{id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
