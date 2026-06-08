defmodule PomeloEx.Cards.Tokenization.Standalone do
  @moduledoc """
  Standalone Tokenization
  """
  alias PomeloEx.Cards.Tokenization.Standalone.UpdateTokensStatusByCardId

  @doc """
  Update status of all tokens for a specific card simultaneously
  """
  defdelegate update_tokens_status_by_card_id(payload),
    to: UpdateTokensStatusByCardId,
    as: :execute
end
