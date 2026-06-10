defmodule PomeloEx.DigitalAccounts.DigitalMovementsAndP2P.UpdateAccountBalance do
  @moduledoc false

  alias PomeloEx.Types.DigitalAccounts.DigitalMovementsAndP2P.UpdateAccountBalanceType

  def execute(%UpdateAccountBalanceType{token: token, account_id: account_id} = payload) do
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.drop([:token, :account_id])
      |> Jason.encode!()

    PomeloEx.Client.request(:patch, "/core/accounts/v1/#{account_id}/balance", body, headers)
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
