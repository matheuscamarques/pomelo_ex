defmodule PomeloEx.Cards.Credits.CreditLinesV2.CancelCreditLine do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.CancelCreditLineType

  def execute(%CancelCreditLineType{token: token, id: id} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)
    body = payload.body |> Jason.encode!()

    http_client.delete("#{url}/lending/v2/credit-lines/#{id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
