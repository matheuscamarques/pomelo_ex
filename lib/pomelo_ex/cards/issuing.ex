defmodule PomeloEx.Cards.Issuing do
  @moduledoc """
  Card issuance lifecycle management.

  This namespace groups all card issuing operations including:
  - `PomeloEx.Cards.Issuing.Cards` — Individual and batch card creation, activation, updates
  - `PomeloEx.Cards.Issuing.Shipments` — Card shipment creation and tracking

  Cards can be physical or virtual, nominate (assigned to a user) or innominate (unassigned).
  """
  alias PomeloEx.Cards.Issuing.Cards
  alias PomeloEx.Cards.Issuing.Shipments

  defdelegate create_card(payload), to: Cards, as: :create_card
  defdelegate search_cards(payload), to: Cards, as: :search_cards
  defdelegate get_card(payload), to: Cards, as: :get_card
  defdelegate update_card(payload), to: Cards, as: :update_card
  defdelegate activate_card(payload), to: Cards, as: :activate_card
  defdelegate card_events(payload), to: Cards, as: :card_events
  defdelegate update_card_shipping(payload), to: Cards, as: :update_card_shipping

  defdelegate create_batch_innominate_cards(payload),
    to: Cards,
    as: :create_batch_innominate_cards

  defdelegate create_multiple_batch_innominate_cards(payload),
    to: Cards,
    as: :create_multiple_batch_innominate_cards

  defdelegate update_card_batch_shipping(payload), to: Cards, as: :update_card_batch_shipping
  defdelegate get_affinity_group(payload), to: Cards, as: :get_affinity_group
  defdelegate create_shipment(payload), to: Shipments, as: :create_shipment
  defdelegate search_shipment(payload), to: Shipments, as: :search_shipment
  defdelegate change_shipment_data(payload), to: Shipments, as: :change_shipment_data
  defdelegate get_shipment(payload), to: Shipments, as: :get_shipment
  defdelegate get_shipment_history(payload), to: Shipments, as: :get_shipment_history
  defdelegate shipment_notifications(payload), to: Shipments, as: :shipment_notifications
  defdelegate request_receiver_data(payload), to: Shipments, as: :request_receiver_data
end
