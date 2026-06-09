defmodule PomeloEx.DigitalAccounts.Queries.GetActivity do
  @moduledoc false

  alias PomeloEx.Types.DigitalAccounts.Queries.GetActivityType

  def execute(%GetActivityType{token: token, id: id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/core/activities/v1/#{id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
