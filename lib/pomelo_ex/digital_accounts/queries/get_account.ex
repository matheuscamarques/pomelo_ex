defmodule PomeloEx.DigitalAccounts.Queries.GetAccount do
  @moduledoc false

  alias PomeloEx.Types.DigitalAccounts.Queries.GetAccountType

  def execute(%GetAccountType{token: token, id: id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/core/accounts/v1/#{id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
