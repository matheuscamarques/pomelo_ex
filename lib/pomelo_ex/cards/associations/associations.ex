defmodule PomeloEx.Cards.Associations.Associations do
  alias PomeloEx.Cards.Associations.Associations.LinkCard
  alias PomeloEx.Cards.Associations.Associations.SeacrhAssociations
  alias PomeloEx.Cards.Associations.Associations.UnlinkCard

  defdelegate link_card(payload), to: LinkCard, as: :execute
  defdelegate search_associations(payload), to: SeacrhAssociations, as: :execute
  defdelegate unlink_card(payload), to: UnlinkCard, as: :execute
end
