defmodule PomeloEx.General.Users.GetUser do
  @moduledoc false

  alias PomeloEx.Types.General.Users.GetUserType

  def execute(%GetUserType{id: id, token: token}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/users/v1/#{id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
