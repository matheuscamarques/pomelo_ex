defmodule PomeloEx.Fraud.SoftBlock.GetSoftBlockStatus do
  @moduledoc false

  alias PomeloEx.Types.Fraud.SoftBlock.GetSoftBlockStatusType

  def execute(%GetSoftBlockStatusType{token: token, merchant_name: merchant_name}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/fraud/merchant/softblock/#{merchant_name}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
