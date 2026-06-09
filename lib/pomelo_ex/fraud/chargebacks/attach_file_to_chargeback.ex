defmodule PomeloEx.Fraud.Chargebacks.AttachFileToChargeback do
  @moduledoc """
  Attaches a file to a chargeback.

  The API expects a `multipart/form-data` upload under the `fileUpload` key.
  This implementation sends a JSON body as a simplified interface.
  Override `execute/1` to handle multipart uploads if needed.
  """

  alias PomeloEx.Types.Fraud.Chargebacks.AttachFileToChargebackType

  def execute(%AttachFileToChargebackType{token: token, chargeback_id: chargeback_id, body: body}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    body = body |> Jason.encode!()

    http_client.post("#{url}/chargebacks/v2/#{chargeback_id}/attachments", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
