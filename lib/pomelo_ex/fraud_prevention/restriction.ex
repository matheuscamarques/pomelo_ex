defmodule PomeloEx.FraudPrevention.Restriction do
  @moduledoc """
  Merchant restriction management (legacy).

  This namespace groups merchant blocking operations:
  - `PomeloEx.FraudPrevention.Restriction.Merchant` — Block/unblock merchants by name
  """

  def execute(payload) do
    raise "Not implemented #{__MODULE__} payload:" <> inspect(payload)
  end
end
