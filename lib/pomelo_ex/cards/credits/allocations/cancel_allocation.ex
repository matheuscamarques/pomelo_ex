defmodule PomeloEx.Cards.Credits.Allocations.CancelAllocation do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.Allocations.CancelAllocationType

  def execute(%CancelAllocationType{token: token, id: id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:post, "/lending/v1/collections/#{id}/cancel", "", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
