defmodule PomeloEx.FraudPrevention.Restriction.Merchant do
  @moduledoc """
  It is a tool that will allow you to block merchants for a certain period of time by entering their exact name.
  """

  alias PomeloEx.FraudPrevention.Restriction.Merchant.BlockMerchant
  alias PomeloEx.FraudPrevention.Restriction.Merchant.GetBlockedMerchants
  alias PomeloEx.FraudPrevention.Restriction.Merchant.RemoveBlockFromMerchant

  defdelegate block_merchant(payload), to: BlockMerchant, as: :execute
  defdelegate get_blocked_merchant(payload), to: GetBlockedMerchants, as: :execute
  defdelegate remove_block_from_merchant(payload), to: RemoveBlockFromMerchant, as: :execute
end
