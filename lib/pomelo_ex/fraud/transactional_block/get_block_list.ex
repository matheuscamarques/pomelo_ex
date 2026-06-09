defmodule PomeloEx.Fraud.TransactionalBlock.GetBlockList do
  @moduledoc false

  alias PomeloEx.Types.Fraud.TransactionalBlock.GetBlockListType

  def execute(%GetBlockListType{token: token, type: type} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    params =
      payload
      |> Map.from_struct()
      |> Map.drop([:token, :type])
      |> Enum.filter(fn {_k, v} -> not is_nil(v) end)
      |> Enum.map(&format_pair/1)
      |> Enum.map(fn {k, v} -> "#{k}=#{v}" end)
      |> Enum.join("&")

    http_client.get("#{url}/fraud/search/#{type}/block?#{params}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end

  defp format_pair({:filter_type, value}), do: {"filter[type]", to_string(value)}
  defp format_pair({:page_size, value}), do: {"page[size]", to_string(value)}
  defp format_pair({:page_number, value}), do: {"page[number]", to_string(value)}
end
