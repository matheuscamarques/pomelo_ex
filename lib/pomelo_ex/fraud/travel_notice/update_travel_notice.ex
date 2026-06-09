defmodule PomeloEx.Fraud.TravelNotice.UpdateTravelNotice do
  @moduledoc false

  alias PomeloEx.Types.Fraud.TravelNotice.UpdateTravelNoticeType

  def execute(%UpdateTravelNoticeType{token: token, body: body}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    body = body |> Jason.encode!()

    http_client.put("#{url}/fraud/travel_notice/v1/user", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
