defmodule PomeloEx.Identity.KYC.ClearUserTestEnvironment do
  @moduledoc false

  alias PomeloEx.Types.Identity.KYC.ClearUserTestEnvironmentType

  def execute(%ClearUserTestEnvironmentType{token: token} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Enum.reject(fn {_, v} -> v == nil end)
      |> Enum.into(%{})
      |> Jason.encode!()

    http_client.post("#{url}/clean_validations", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
