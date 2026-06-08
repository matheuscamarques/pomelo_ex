defmodule PomeloEx.General.Users.SetCustomFieldMappings do
  @moduledoc false

  alias PomeloEx.Types.General.Users.SetCustomFieldMappingsType

  def execute(%SetCustomFieldMappingsType{token: token, mappings: mappings}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    body =
      mappings
      |> Enum.map(fn mapping ->
        mapping
        |> Map.from_struct()
        |> Enum.reject(fn {_, v} -> v == nil end)
        |> Enum.into(%{})
      end)
      |> Jason.encode!()

    http_client.post("#{url}/users/v1/custom-fields/mappings", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
