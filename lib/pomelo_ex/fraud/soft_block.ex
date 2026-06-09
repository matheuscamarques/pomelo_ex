defmodule PomeloEx.Fraud.SoftBlock do
  @moduledoc """
  The Soft Block service allows you to temporarily soft-block merchants based on
  failed transaction attempts, providing protection against suspicious activity.

  Want to know more about soft blocks? Check out our
  [documentation](https://docs.pomelo.la/docs/fraud/soft-block).
  """
  alias PomeloEx.Fraud.SoftBlock.CreateSoftBlock
  alias PomeloEx.Fraud.SoftBlock.GetSoftBlockList
  alias PomeloEx.Fraud.SoftBlock.GetSoftBlockStatus
  alias PomeloEx.Fraud.SoftBlock.RemoveSoftBlock
  alias PomeloEx.Fraud.SoftBlock.UpdateSoftBlock

  @doc """
  Soft-block a merchant by name.
  """
  defdelegate create_soft_block(payload), to: CreateSoftBlock, as: :execute

  @doc """
  Get the status of a merchant's soft block.
  """
  defdelegate get_soft_block_status(payload), to: GetSoftBlockStatus, as: :execute

  @doc """
  Get a paginated list of merchants' soft blocks.
  """
  defdelegate get_soft_block_list(payload), to: GetSoftBlockList, as: :execute

  @doc """
  Update a merchant's soft block expiration.
  """
  defdelegate update_soft_block(payload), to: UpdateSoftBlock, as: :execute

  @doc """
  Remove a merchant's soft block.
  """
  defdelegate remove_soft_block(payload), to: RemoveSoftBlock, as: :execute
end
