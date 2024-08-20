defmodule PomeloEx.FraudPrevention.Restriction.Merchant do
  @moduledoc """
  It is a tool that will allow you to block merchants for a certain period of time by entering their exact name.
  """

  @doc """
  Get blocked merchants
  This endpoint allows you to check if a business has an active block.
  """
  alias PomeloEx.FraudPrevention.Restriction.Merchant.GetBlockedMerchants
  defdelegate get_blocked_merchant(payload), to: GetBlockedMerchants, as: :execute

  @doc """
  Remove block from a merchant
  This endpoint allows you to remove the block from a merchant.
  """
  alias PomeloEx.FraudPrevention.Restriction.Merchant.RemoveBlockFromMerchant
  defdelegate remove_block_from_merchant(payload), to: RemoveBlockFromMerchant, as: :execute

  @doc """
  Block merchant
  This endpoint allows you to block merchants for a certain period of time. You can customize the blocking duration or use the default period of one month.
  """
  alias PomeloEx.FraudPrevention.Restriction.Merchant.BlockMerchant
  defdelegate block_merchant(payload), to: BlockMerchant, as: :execute
end
