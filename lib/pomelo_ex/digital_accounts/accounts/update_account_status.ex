defmodule PomeloEx.DigitalAccounts.Accounts.UpdateAccountStatus do
  @moduledoc false

  alias PomeloEx.Types.DigitalAccounts.Accounts.UpdateAccountStatusType

  def execute(%UpdateAccountStatusType{token: token, id: id} = payload) do
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.drop([:token, :id])
      |> Jason.encode!()

    PomeloEx.Client.request(:patch, "/core/accounts/v1/#{id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
