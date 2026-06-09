defmodule PomeloEx.Fraud.SoftBlock.RemoveSoftBlock do
  @moduledoc false

  alias PomeloEx.Types.Fraud.SoftBlock.RemoveSoftBlockType

  def execute(%RemoveSoftBlockType{token: token, merchant_name: merchant_name}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.delete("#{url}/fraud/merchant/softblock/#{merchant_name}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
