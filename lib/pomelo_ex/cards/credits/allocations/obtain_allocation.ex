defmodule PomeloEx.Cards.Credits.Allocations.ObtainAllocation do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.Allocations.ObtainAllocationType

  def execute(%ObtainAllocationType{token: token, id: id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/lending/v1/collections/#{id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
