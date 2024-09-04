defmodule PomeloEx.General.Users.ModifyUser do
  @moduledoc false
  alias PomeloEx.General.Authorization
  alias PomeloEx.Types.General.Users.ModifyUserType

  def execute(%ModifyUserType{id: id} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers()

    body =
      payload
      |> Map.from_struct()
      |> Enum.reject(fn {_, v} -> v == nil end)
      |> Enum.into(%{})
      |> Jason.encode!()

    http_client.patch("#{url}/users/v1/#{id}", body, headers)
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
