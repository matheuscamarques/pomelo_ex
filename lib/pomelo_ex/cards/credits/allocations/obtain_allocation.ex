defmodule PomeloEx.Cards.Credits.Allocations.ObtainAllocation do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.Allocations.ObtainAllocationType

  def execute(%ObtainAllocationType{token: token, id: id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/lending/v1/collections/#{id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
