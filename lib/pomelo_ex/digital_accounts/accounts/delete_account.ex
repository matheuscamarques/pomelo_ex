defmodule PomeloEx.DigitalAccounts.Accounts.DeleteAccount do
  @moduledoc false

  alias PomeloEx.Types.DigitalAccounts.Accounts.DeleteAccountType

  def execute(%DeleteAccountType{token: token, id: id} = payload) do
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.drop([:token, :id])
      |> Jason.encode!()

    PomeloEx.Client.request(:delete, "/core/accounts/v1/#{id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
