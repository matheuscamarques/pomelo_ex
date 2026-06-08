defmodule PomeloEx.General.Users.ListCustomFieldMappings do
  @moduledoc false

  alias PomeloEx.Types.General.Users.ListCustomFieldMappingsType

  def execute(%ListCustomFieldMappingsType{token: token}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/users/v1/custom-fields/mappings", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
