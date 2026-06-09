defmodule PomeloEx.Cards.Credits.Hierarchies.UpdateNode do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.Hierarchies.UpdateNodeType

  def execute(%UpdateNodeType{token: token, hierarchy_id: hierarchy_id, node_id: node_id} = payload) do
    headers = build_headers(token)
    body = payload.body |> Jason.encode!()

    PomeloEx.Client.request(:patch, "/lending/v1/hierarchies/#{hierarchy_id}/nodes/#{node_id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
