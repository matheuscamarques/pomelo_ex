defmodule PomeloEx.Cards.Credits.CreditLinesV2.GetCreditLine do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.GetCreditLineType

  def execute(%GetCreditLineType{token: token, id: id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/lending/v2/credit-lines/#{id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
