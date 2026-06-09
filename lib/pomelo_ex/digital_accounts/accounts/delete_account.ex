defmodule PomeloEx.DigitalAccounts.Accounts.DeleteAccount do
  @moduledoc false

  alias PomeloEx.Types.DigitalAccounts.Accounts.DeleteAccountType

  def execute(%DeleteAccountType{token: token, id: id} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.drop([:token, :id])
      |> Jason.encode!()

    http_client.delete("#{url}/core/accounts/v1/#{id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
