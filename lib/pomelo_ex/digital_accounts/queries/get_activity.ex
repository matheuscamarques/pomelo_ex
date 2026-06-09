defmodule PomeloEx.DigitalAccounts.Queries.GetActivity do
  @moduledoc false

  alias PomeloEx.Types.DigitalAccounts.Queries.GetActivityType

  def execute(%GetActivityType{token: token, id: id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/core/activities/v1/#{id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
