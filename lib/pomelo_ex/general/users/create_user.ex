defmodule PomeloEx.General.Users.CreateUser do
  @moduledoc false
  use TypedEctoSchema

  alias PomeloEx.General.Authorization
  alias PomeloEx.Types.General.Users.CreateUserType

  @idempotency_key_length 14

  def execute(%CreateUserType{} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers()
    body = Jason.encode!(payload)

    http_client.post("#{url}/users/v1/", body, headers)
  end

  defp build_headers do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = Authorization.request_token()

    token =
      body
      |> Jason.decode!()
      |> Map.fetch!("access_token")

    idempotency_key =
      @idempotency_key_length
      |> :crypto.strong_rand_bytes()
      |> Base.encode64(padding: false)
      |> binary_part(0, @idempotency_key_length)

    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"},
      {"x-idempotency-key", idempotency_key}
    ]
  end
end
