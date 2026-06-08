defmodule PomeloEx.Identity.KYC.CancelSession do
  @moduledoc false

  alias PomeloEx.Types.Identity.KYC.CancelSessionType

  def execute(%CancelSessionType{token: token, session_id: session_id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.delete("#{url}/identity/v1/sessions/#{session_id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
