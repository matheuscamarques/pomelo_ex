defmodule PomeloEx.Cards.Credits.CreditLines.CancelCreditLine do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLines.CancelCreditLineType

  def execute(%CancelCreditLineType{token: token, id: id} = payload) do
    headers = build_headers(token)

    body = payload.body |> Jason.encode!()

    PomeloEx.Client.request(:delete, "/lending/v1/credit-lines/#{id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
