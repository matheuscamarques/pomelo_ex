defmodule PomeloEx.Fraud.TransactionalBlock do
  @moduledoc """
  The Transactional Block service allows you to manage transaction blocks by merchant
  (name, ID, or MCC) or by country, with flexible duration.

  Want to know more about transactional blocks? Check out our
  [documentation](https://docs.pomelo.la/docs/fraud/transactional-block).
  """
  alias PomeloEx.Fraud.TransactionalBlock.CreateBlock
  alias PomeloEx.Fraud.TransactionalBlock.DeleteBlock
  alias PomeloEx.Fraud.TransactionalBlock.GetBlockList
  alias PomeloEx.Fraud.TransactionalBlock.GetBlockStatus
  alias PomeloEx.Fraud.TransactionalBlock.UpdateBlock

  @doc """
  Create a block for a merchant or country.

  `type` values: `merchant_id`, `merchant_name`, `merchant_mcc`, `country`.
  Body varies by type (e.g., `merchant_id` + `expiration_date`).
  """
  defdelegate create_block(payload), to: CreateBlock, as: :execute

  @doc """
  Get the status of an active block by identifier.
  """
  defdelegate get_block_status(payload), to: GetBlockStatus, as: :execute

  @doc """
  Get a paginated list of active blocks by type.

  `type` values: `merchant`, `country`.
  Supported filters: `filter[type]` (e.g., `id`, `mcc`, `code`).
  """
  defdelegate get_block_list(payload), to: GetBlockList, as: :execute

  @doc """
  Update the duration of an existing block.

  `type` values: `merchant_id`, `merchant_name`, `merchant_mcc`, `country`.
  """
  defdelegate update_block(payload), to: UpdateBlock, as: :execute

  @doc """
  Delete an active block by identifier.
  """
  defdelegate delete_block(payload), to: DeleteBlock, as: :execute
end
