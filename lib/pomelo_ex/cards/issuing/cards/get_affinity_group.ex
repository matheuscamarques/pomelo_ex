defmodule PomeloEx.Cards.Issuing.Cards.GetAffinityGroup do
  @moduledoc false

  alias PomeloEx.Types.Cards.Issuing.GetAffinityGroupType

  def execute(%GetAffinityGroupType{token: token, id: id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/config/affinity-groups/#{id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
