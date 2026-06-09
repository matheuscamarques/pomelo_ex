defmodule PomeloEx.Cards.Credits.CreditLinesV2.UpdateCreditLine do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.UpdateCreditLineType

  def execute(%UpdateCreditLineType{token: token, id: id} = payload) do
    headers = build_headers(token)
    body = payload.body |> Jason.encode!()

    PomeloEx.Client.request(:patch, "/lending/v2/credit-lines/#{id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
