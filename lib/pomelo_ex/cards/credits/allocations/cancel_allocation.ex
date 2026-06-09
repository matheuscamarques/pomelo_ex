defmodule PomeloEx.Cards.Credits.Allocations.CancelAllocation do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.Allocations.CancelAllocationType

  def execute(%CancelAllocationType{token: token, id: id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.post("#{url}/lending/v1/collections/#{id}/cancel", "", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
