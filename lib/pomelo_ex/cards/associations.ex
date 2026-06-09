defmodule PomeloEx.Cards.Associations do
  @moduledoc """
  Card-to-account and card-to-credit-line associations.

  This namespace groups operations for linking cards to user accounts and associating
  cards with credit lines.

  ## Sub-modules

  - `PomeloEx.Cards.Associations.AssociateCredit` — Associate cards with credit lines
  - `PomeloEx.Cards.Associations.Associations` — Link/unlink cards from user accounts
  """

  def execute(payload) do
    raise "Not implemented #{__MODULE__} payload:" <> inspect(payload)
  end
end
