defmodule PomeloEx.Fraud.SoftBlock.UpdateSoftBlock do
  @moduledoc false

  alias PomeloEx.Types.Fraud.SoftBlock.UpdateSoftBlockType

  def execute(%UpdateSoftBlockType{token: token} = payload) do
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Enum.filter(fn {_k, v} -> not is_nil(v) end)
      |> Map.new()
      |> Jason.encode!()

    PomeloEx.Client.request(:put, "/fraud/merchant/softblock", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
