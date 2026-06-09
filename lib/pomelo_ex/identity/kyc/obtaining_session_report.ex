defmodule PomeloEx.Identity.KYC.ObtainingSessionReport do
  @moduledoc false

  alias PomeloEx.Types.Identity.KYC.ObtainingSessionReportType

  def execute(%ObtainingSessionReportType{token: token, session_id: session_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/identity/v1/sessions/#{session_id}/report", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
