defmodule PomeloEx.Identity.KYC.ClearUserTestEnvironment do
  @moduledoc false

  alias PomeloEx.Types.Identity.KYC.ClearUserTestEnvironmentType

  def execute(%ClearUserTestEnvironmentType{token: token} = payload) do
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Enum.reject(fn {_, v} -> v == nil end)
      |> Enum.into(%{})
      |> Jason.encode!()

    PomeloEx.Client.request(:post, "/clean_validations", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
