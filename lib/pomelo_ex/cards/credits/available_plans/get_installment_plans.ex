defmodule PomeloEx.Cards.Credits.AvailablePlans.GetInstallmentPlans do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.AvailablePlans.GetInstallmentPlansType

  def execute(%GetInstallmentPlansType{token: token, credit_line_id: credit_line_id} = payload) do
    headers = build_headers(token)

    params =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Map.delete(:credit_line_id)
      |> Enum.filter(fn {_k, v} -> not is_nil(v) end)
      |> Enum.map(&format_pair/1)
      |> Enum.map_join("&", fn {k, v} -> "#{k}=#{v}" end)

    PomeloEx.Client.request(
      :get,
      "/lending/v1/credit-lines/#{credit_line_id}/installment-plans/?#{params}",
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

  defp format_pair({:page_number, value}), do: {"page[number]", to_string(value)}
  defp format_pair({:page_size, value}), do: {"page[size]", to_string(value)}

  defp format_pair({key, value}) do
    key = key |> Atom.to_string()

    key =
      cond do
        key == "filter_status" -> "filter[status]"
        key == "filter_installment_status" -> "filter[installment_status]"
        key == "filter_transaction_id" -> "filter[transaction_id]"
        true -> key
      end

    {key, to_string(value)}
  end
end
