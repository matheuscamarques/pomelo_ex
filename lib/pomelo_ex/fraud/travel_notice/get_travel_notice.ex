defmodule PomeloEx.Fraud.TravelNotice.GetTravelNotice do
  @moduledoc false

  alias PomeloEx.Types.Fraud.TravelNotice.GetTravelNoticeType

  def execute(%GetTravelNoticeType{token: token, user_id: user_id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/fraud/travel_notice/v1/user/#{user_id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
