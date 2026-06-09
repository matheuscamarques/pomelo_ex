defmodule PomeloEx.Cards.Credits.Hierarchies do
  @moduledoc """
  The Hierarchies service allows you to create and manage hierarchical nodes within a credit line,
  organizing them into a structure of areas and users with their own or inherited credit limits.

  Want to know more about hierarchies? Check out our [documentation](https://docs.pomelo.la/docs/cards/lending/hierarchies).
  """
  alias PomeloEx.Cards.Credits.Hierarchies.CreateNode
  alias PomeloEx.Cards.Credits.Hierarchies.GetNode
  alias PomeloEx.Cards.Credits.Hierarchies.UpdateNode

  @doc """
  Create a child node (area or user) within a hierarchy.
  """
  defdelegate create_node(payload), to: CreateNode, as: :execute

  @doc """
  Get the details of a node within a hierarchy.
  """
  defdelegate get_node(payload), to: GetNode, as: :execute

  @doc """
  Update the configuration of a node within a hierarchy.
  """
  defdelegate update_node(payload), to: UpdateNode, as: :execute
end
