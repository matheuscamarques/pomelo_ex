defmodule PomeloEx.Cards.Credits.CreditProduct.DeactivatingProduct do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditProduct.DeactivatingProductType

  def execute(%DeactivatingProductType{token: token, id: id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:delete, "/lending/v1/products/#{id}", "", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
