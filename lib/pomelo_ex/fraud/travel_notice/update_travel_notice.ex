defmodule PomeloEx.Fraud.TravelNotice.UpdateTravelNotice do
  @moduledoc false

  alias PomeloEx.Types.Fraud.TravelNotice.UpdateTravelNoticeType

  def execute(%UpdateTravelNoticeType{token: token, body: body}) do
    headers = build_headers(token)

    body = body |> Jason.encode!()

    PomeloEx.Client.request(:put, "/fraud/travel_notice/v1/user", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
