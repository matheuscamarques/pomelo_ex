defmodule PomeloEx.Cards.Credits.Hierarchies.GetNode do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.Hierarchies.GetNodeType

  def execute(%GetNodeType{token: token, hierarchy_id: hierarchy_id, node_id: node_id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/lending/v1/hierarchies/#{hierarchy_id}/nodes/#{node_id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
