defmodule PomeloEx.Identity.KYC.ObtainingSessionReport do
  @moduledoc false

  alias PomeloEx.Types.Identity.KYC.ObtainingSessionReportType

  def execute(%ObtainingSessionReportType{token: token, session_id: session_id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/identity/v1/sessions/#{session_id}/report", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
