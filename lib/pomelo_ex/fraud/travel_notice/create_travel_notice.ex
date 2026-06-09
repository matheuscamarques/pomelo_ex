defmodule PomeloEx.Fraud.TravelNotice.CreateTravelNotice do
  @moduledoc false

  alias PomeloEx.Types.Fraud.TravelNotice.CreateTravelNoticeType

  def execute(%CreateTravelNoticeType{token: token, body: body}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    body = body |> Jason.encode!()

    http_client.post("#{url}/fraud/travel_notice/v1/user", body, headers)
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
