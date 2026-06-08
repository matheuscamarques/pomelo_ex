defmodule PomeloEx.Identity.KYB.GetSession do
  @moduledoc false

  alias PomeloEx.Types.Identity.KYB.GetSessionType

  def execute(%GetSessionType{token: token, session_id: session_id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/identity/v1/sessions/#{session_id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
