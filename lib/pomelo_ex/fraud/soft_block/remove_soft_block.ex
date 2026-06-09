defmodule PomeloEx.Fraud.SoftBlock.RemoveSoftBlock do
  @moduledoc false

  alias PomeloEx.Types.Fraud.SoftBlock.RemoveSoftBlockType

  def execute(%RemoveSoftBlockType{token: token, merchant_name: merchant_name}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:delete, "/fraud/merchant/softblock/#{merchant_name}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
