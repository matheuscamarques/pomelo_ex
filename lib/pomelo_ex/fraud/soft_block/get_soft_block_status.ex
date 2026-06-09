defmodule PomeloEx.Fraud.SoftBlock.GetSoftBlockStatus do
  @moduledoc false

  alias PomeloEx.Types.Fraud.SoftBlock.GetSoftBlockStatusType

  def execute(%GetSoftBlockStatusType{token: token, merchant_name: merchant_name}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/fraud/merchant/softblock/#{merchant_name}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
