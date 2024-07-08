defmodule PomeloEx.Cards.Issuing.Cards do
  @moduledoc """
  Cards
  The Cards API contains all the endpoints needed to create nominate and innominate cards, activate them, run queries, retrieve information on a particular card, and more.
  """
  alias PomeloEx.Cards.Issuing.Cards.UpdateCard
  alias PomeloEx.Cards.Issuing.Cards.UpdateCardShipping
  alias PomeloEx.Cards.Issuing.Cards.UpdateCardBatchShipping
  alias PomeloEx.Cards.Issuing.Cards.SearchCards
  alias PomeloEx.Cards.Issuing.Cards.GetCard
  alias PomeloEx.Cards.Issuing.Cards.GetAffinityGroup
  alias PomeloEx.Cards.Issuing.Cards.CreateMultipleBatchInnominateCards
  alias PomeloEx.Cards.Issuing.Cards.CreateBatchInnominateCards
  alias PomeloEx.Cards.Issuing.Cards.CardEvents
  alias PomeloEx.Cards.Issuing.Cards.ActivateCard


  defdelegate activate_card(payload), to: ActivateCard, as: :execute
  defdelegate card_events(payload),to: CardEvents, as: :execute
  defdelegate create_batch_innominate_cards(payload), to: CreateBatchInnominateCards, as: :execute
  defdelegate create_multiple_batch_innominate_cards(payload), to: CreateMultipleBatchInnominateCards, as: :execute
  defdelegate get_affinity_group(payload), to: GetAffinityGroup, as: :execute
  defdelegate get_card(payload), to: GetCard, as: :execute
  defdelegate search_cards(payload), to: SearchCards, as: :execute
  defdelegate update_card_batch_shipping(payload), to: UpdateCardBatchShipping, as: :execute
  defdelegate update_card_shipping(payload), to: UpdateCardShipping, as: :execute
  defdelegate update_card(payload), to: UpdateCard, as: :execute

end
