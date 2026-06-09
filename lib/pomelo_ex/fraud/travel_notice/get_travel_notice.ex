defmodule PomeloEx.Fraud.TravelNotice.GetTravelNotice do
  @moduledoc false

  alias PomeloEx.Types.Fraud.TravelNotice.GetTravelNoticeType

  def execute(%GetTravelNoticeType{token: token, user_id: user_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/fraud/travel_notice/v1/user/#{user_id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
