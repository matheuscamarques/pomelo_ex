defmodule PomeloEx.Cards.Issuing do
  @moduledoc """
  Card issuance lifecycle management.

  This namespace groups all card issuing operations including:
  - `PomeloEx.Cards.Issuing.Cards` — Individual and batch card creation, activation, updates
  - `PomeloEx.Cards.Issuing.Shipments` — Card shipment creation and tracking

  Cards can be physical or virtual, nominate (assigned to a user) or innominate (unassigned).
  """

  def execute(payload) do
    raise "Not implemented #{__MODULE__} payload:" <> inspect(payload)
  end
end
