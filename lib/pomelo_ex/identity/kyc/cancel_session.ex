defmodule PomeloEx.Identity.KYC.CancelSession do
  @moduledoc false

  alias PomeloEx.Types.Identity.KYC.CancelSessionType

  def execute(%CancelSessionType{token: token, session_id: session_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:delete, "/identity/v1/sessions/#{session_id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
