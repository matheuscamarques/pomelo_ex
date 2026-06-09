defmodule PomeloEx.Fraud.Chargebacks.FindChargebacks do
  @moduledoc false

  alias PomeloEx.Types.Fraud.Chargebacks.FindChargebacksType

  def execute(%FindChargebacksType{token: token} = payload) do
    headers = build_headers(token)

    params =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Enum.filter(fn {_k, v} -> not is_nil(v) end)
      |> Enum.map(&format_pair/1)
      |> Enum.map(fn {k, v} -> "#{k}=#{v}" end)
      |> Enum.join("&")

    PomeloEx.Client.request(:get, "/chargebacks/v2/?#{params}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end

  defp format_pair({:filter_user_id, value}), do: {"filter[user_id]", to_string(value)}
  defp format_pair({:filter_status, value}), do: {"filter[status]", to_string(value)}
  defp format_pair({:filter_transaction_id, value}), do: {"filter[transaction_id]", to_string(value)}
  defp format_pair({:filter_created_at_from, value}), do: {"filter[created_at][from]", to_string(value)}
  defp format_pair({:filter_created_at_to, value}), do: {"filter[created_at][to]", to_string(value)}
  defp format_pair({:filter_updated_at_from, value}), do: {"filter[updated_at][from]", to_string(value)}
  defp format_pair({:filter_updated_at_to, value}), do: {"filter[updated_at][to]", to_string(value)}
  defp format_pair({:page_size, value}), do: {"page[size]", to_string(value)}
  defp format_pair({:page_number, value}), do: {"page[number]", to_string(value)}
  defp format_pair({:sort, value}), do: {"sort", to_string(value)}
end
