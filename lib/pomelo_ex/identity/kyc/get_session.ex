defmodule PomeloEx.Identity.KYC.GetSession do
  @moduledoc false

  alias PomeloEx.Types.Identity.KYC.GetSessionType

  def execute(%GetSessionType{token: token, session_id: session_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/identity/v1/sessions/#{session_id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
