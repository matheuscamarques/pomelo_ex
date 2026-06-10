defmodule PomeloEx.Cards.Credits.CreditLines.UpdateExpirationDate do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLines.UpdateExpirationDateType

  def execute(%UpdateExpirationDateType{token: token, credit_line_id: credit_line_id} = payload) do
    headers = build_headers(token)

    body = payload.body |> Jason.encode!()

    PomeloEx.Client.request(
      :post,
      "/lending/v1/credit-lines/#{credit_line_id}/config/due-date",
      body,
      headers
    )
  end

  defp build_headers(token) do
    idempotency_key_length = Application.get_env(:pomelo_ex, :idempotency_key_length)

    idempotency_key =
      idempotency_key_length
      |> :crypto.strong_rand_bytes()
      |> Base.encode64(padding: false)
      |> binary_part(0, idempotency_key_length)

    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"},
      {"x-idempotency-key", idempotency_key}
    ]
  end
end
