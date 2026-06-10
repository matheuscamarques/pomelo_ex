defmodule PomeloEx.Cards.Credits.Hierarchies.GetNode do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.Hierarchies.GetNodeType

  def execute(%GetNodeType{token: token, hierarchy_id: hierarchy_id, node_id: node_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(
      :get,
      "/lending/v1/hierarchies/#{hierarchy_id}/nodes/#{node_id}",
      nil,
      headers
    )
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
