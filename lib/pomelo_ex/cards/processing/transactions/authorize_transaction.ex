defmodule PomeloEx.Cards.Processing.Transactions.AuthorizeTransaction do
  @moduledoc false

  alias PomeloEx.Types.Cards.Processing.Transactions.AuthorizeTransactionType

  def execute(%AuthorizeTransactionType{} = payload) do
    {:ok, payload}
  end
end
