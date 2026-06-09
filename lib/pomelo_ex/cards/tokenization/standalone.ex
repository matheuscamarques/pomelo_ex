defmodule PomeloEx.Cards.Tokenization.Standalone do
  @moduledoc """
  Standalone token management.

  Provides direct token lifecycle management operations independent of wallet-specific
  provisioning flows, such as batch status updates for tokens associated with a card.
  """
  alias PomeloEx.Cards.Tokenization.Standalone.UpdateTokensStatusByCardId

  @doc """
  Update status of all tokens for a specific card simultaneously
  """
  defdelegate update_tokens_status_by_card_id(payload),
    to: UpdateTokensStatusByCardId,
    as: :execute
end
