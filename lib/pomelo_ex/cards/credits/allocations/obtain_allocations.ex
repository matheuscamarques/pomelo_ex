defmodule PomeloEx.Cards.Credits.Allocations.ObtainAllocations do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.Allocations.ObtainAllocationsType

  def execute(%ObtainAllocationsType{token: token, filter_credit_line_id: filter_credit_line_id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/lending/v1/collections/?filter[credit_line_id]=#{filter_credit_line_id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
