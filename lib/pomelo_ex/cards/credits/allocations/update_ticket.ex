defmodule PomeloEx.Cards.Credits.Allocations.UpdateTicket do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.Allocations.UpdateTicketType

  def execute(%UpdateTicketType{token: token, credit_line_id: credit_line_id} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)
    body = payload.body |> Jason.encode!()

    http_client.patch("#{url}/lending/v1/payment-requests/#{credit_line_id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
