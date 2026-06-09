defmodule PomeloEx.Cards.Credits.CreditLines.GetCreditLine do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLines.GetCreditLineType

  def execute(%GetCreditLineType{token: token, id: id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/lending/v1/credit-lines/#{id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
