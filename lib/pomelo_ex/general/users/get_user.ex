defmodule PomeloEx.General.Users.GetUser do
  @moduledoc false

  alias PomeloEx.General.Authorization
  alias PomeloEx.Types.General.Users.GetUserType

  def execute(%GetUserType{id: id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers()

    http_client.get("#{url}/users/v1/#{id}", headers)
  end

  defp build_headers do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = Authorization.request_token()

    token =
      body
      |> Jason.decode!()
      |> Map.fetch!("access_token")

    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
