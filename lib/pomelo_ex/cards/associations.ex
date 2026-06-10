defmodule PomeloEx.Cards.Associations do
  @moduledoc """
  Card-to-account and card-to-credit-line associations.

  This namespace groups operations for linking cards to user accounts and associating
  cards with credit lines.

  ## Sub-modules

  - `PomeloEx.Cards.Associations.AssociateCredit` — Associate cards with credit lines
  - `PomeloEx.Cards.Associations.Associations` — Link/unlink cards from user accounts
  """
  alias PomeloEx.Cards.Associations.AssociateCredit
  alias PomeloEx.Cards.Associations.Associations

  defdelegate associate_card_with_line_of_credit(payload),
    to: AssociateCredit,
    as: :associate_card_with_line_of_credit

  defdelegate get_association_by_credit_line(payload),
    to: AssociateCredit,
    as: :get_association_by_credit_line

  defdelegate get_associations(payload), to: AssociateCredit, as: :get_associations
  defdelegate link_card(payload), to: Associations, as: :link_card
  defdelegate unlink_card(payload), to: Associations, as: :unlink_card
  defdelegate search_associations(payload), to: Associations, as: :search_associations
end
