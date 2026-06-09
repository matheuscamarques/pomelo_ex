defmodule PomeloEx.Cards.Issuing.Shipments.RequestReceiverData do
  @moduledoc false

  alias PomeloEx.Types.Cards.Issuing.RequestReceiverDataType

  def execute(%RequestReceiverDataType{token: token, shipment_id: shipment_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:post, "/shipping/v1/#{shipment_id}/receiver", "{}", headers)
  end

  defp build_headers(token) do
    idempotency_key_length = Application.get_env(:pomelo_ex, :idempotency_key_length)

    idempotency_key =
      idempotency_key_length
      |> :crypto.strong_rand_bytes()
      |> Base.encode64(padding: false)
      |> binary_part(0, idempotency_key_length)

    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"},
      {"x-idempotency-key", idempotency_key}
    ]
  end
end
