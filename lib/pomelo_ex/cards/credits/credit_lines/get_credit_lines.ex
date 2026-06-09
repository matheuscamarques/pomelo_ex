defmodule PomeloEx.Cards.Credits.CreditLines.GetCreditLines do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLines.GetCreditLinesType

  def execute(%GetCreditLinesType{token: token} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    params =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Enum.filter(fn {_k, v} -> not is_nil(v) end)
      |> Enum.map(&format_pair/1)
      |> Enum.map(fn {k, v} -> "#{k}=#{v}" end)
      |> Enum.join("&")

    http_client.get("#{url}/lending/v1/credit-lines/?#{params}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end

  defp format_pair({key, value}) do
    {parse_key(Atom.to_string(key)), to_string(value)}
  end

  defp parse_key("filter_id"), do: "filter[id]"
  defp parse_key("filter_user_id"), do: "filter[user_id]"
  defp parse_key("filter_status"), do: "filter[status]"
  defp parse_key("filter_offer_start_date_from"), do: "filter[offer_start_date][from]"
  defp parse_key("filter_offer_start_date_to"), do: "filter[offer_start_date][to]"
  defp parse_key("filter_activation_date_from"), do: "filter[activation_date][from]"
  defp parse_key("filter_activation_date_to"), do: "filter[activation_date][to]"
  defp parse_key("filter_user_scoring"), do: "filter[user_scoring]"
  defp parse_key(other), do: other
end
