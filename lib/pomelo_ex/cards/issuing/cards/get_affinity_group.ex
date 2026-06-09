defmodule PomeloEx.Cards.Issuing.Cards.GetAffinityGroup do
  @moduledoc false

  alias PomeloEx.Types.Cards.Issuing.GetAffinityGroupType

  def execute(%GetAffinityGroupType{token: token, id: id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/config/affinity-groups/#{id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
