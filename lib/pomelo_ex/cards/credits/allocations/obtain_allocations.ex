defmodule PomeloEx.Cards.Credits.Allocations.ObtainAllocations do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.Allocations.ObtainAllocationsType

  def execute(%ObtainAllocationsType{token: token, filter_credit_line_id: filter_credit_line_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(
      :get,
      "/lending/v1/collections/?filter[credit_line_id]=#{filter_credit_line_id}",
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
