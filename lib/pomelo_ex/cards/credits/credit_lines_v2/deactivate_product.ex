defmodule PomeloEx.Cards.Credits.CreditLinesV2.DeactivateProduct do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.DeactivateProductType

  def execute(%DeactivateProductType{token: token, id: id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:delete, "/lending/v2/products/#{id}", "", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
