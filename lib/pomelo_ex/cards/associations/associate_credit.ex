defmodule PomeloEx.Cards.Associations.AssociateCredit do
  @moduledoc """
  This service allows you to associate a line of credit with a specific credit card.
  """

  alias PomeloEx.Cards.Associations.AssociateCredit.AssociateCardWithLineOfCredit
  alias PomeloEx.Cards.Associations.AssociateCredit.GetAssociations
  alias PomeloEx.Cards.Associations.AssociateCredit.GetAssociationsByCreditLine

  defdelegate associate_card_with_line_of_credit(payload),
    to: AssociateCardWithLineOfCredit,
    as: :execute

  defdelegate get_associations(payload), to: GetAssociations, as: :execute
  defdelegate get_association_by_credit_line, to: GetAssociationsByCreditLine, as: :execute
end
