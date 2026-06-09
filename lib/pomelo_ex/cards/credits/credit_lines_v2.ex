defmodule PomeloEx.Cards.Credits.CreditLinesV2 do
  @moduledoc """
  The Credit Lines V2 service allows you to create and manage credit products, segments, pricing configurations, and credit lines.

  This is the V2 version of the Credit Lines API, using the `/lending/v2/` base path.

  Want to know more about credit lines? Check out our [documentation](https://docs.pomelo.la/docs/cards/lending/credit-line).
  """
  alias PomeloEx.Cards.Credits.CreditLinesV2.CancelCreditLine
  alias PomeloEx.Cards.Credits.CreditLinesV2.CreateCreditLine
  alias PomeloEx.Cards.Credits.CreditLinesV2.CreatePricing
  alias PomeloEx.Cards.Credits.CreditLinesV2.CreateProduct
  alias PomeloEx.Cards.Credits.CreditLinesV2.CreateSegment
  alias PomeloEx.Cards.Credits.CreditLinesV2.DeactivateProduct
  alias PomeloEx.Cards.Credits.CreditLinesV2.GetCreditLine
  alias PomeloEx.Cards.Credits.CreditLinesV2.GetProduct
  alias PomeloEx.Cards.Credits.CreditLinesV2.GetProducts
  alias PomeloEx.Cards.Credits.CreditLinesV2.GetSegment
  alias PomeloEx.Cards.Credits.CreditLinesV2.GetSegments
  alias PomeloEx.Cards.Credits.CreditLinesV2.ModifyPricing
  alias PomeloEx.Cards.Credits.CreditLinesV2.UpdateCreditLine
  alias PomeloEx.Cards.Credits.CreditLinesV2.UpdateProduct
  alias PomeloEx.Cards.Credits.CreditLinesV2.UpdateSegment

  @doc """
  Create a new credit product.
  """
  defdelegate create_product(payload), to: CreateProduct, as: :execute

  @doc """
  Get all credit products. Supports filtering by name, status, and country.
  """
  defdelegate get_products(payload), to: GetProducts, as: :execute

  @doc """
  Get a credit product by ID.
  """
  defdelegate get_product(payload), to: GetProduct, as: :execute

  @doc """
  Update a credit product.
  """
  defdelegate update_product(payload), to: UpdateProduct, as: :execute

  @doc """
  Deactivate a credit product.
  """
  defdelegate deactivate_product(payload), to: DeactivateProduct, as: :execute

  @doc """
  Create a pricing configuration for a product.
  """
  defdelegate create_pricing(payload), to: CreatePricing, as: :execute

  @doc """
  Modify a pending pricing configuration for a product.
  """
  defdelegate modify_pricing(payload), to: ModifyPricing, as: :execute

  @doc """
  Create a segment for a product.
  """
  defdelegate create_segment(payload), to: CreateSegment, as: :execute

  @doc """
  Get all segments for a product.
  """
  defdelegate get_segments(payload), to: GetSegments, as: :execute

  @doc """
  Get a segment by ID.
  """
  defdelegate get_segment(payload), to: GetSegment, as: :execute

  @doc """
  Update a segment.
  """
  defdelegate update_segment(payload), to: UpdateSegment, as: :execute

  @doc """
  Create a new credit line.
  """
  defdelegate create_credit_line(payload), to: CreateCreditLine, as: :execute

  @doc """
  Get a credit line by ID.
  """
  defdelegate get_credit_line(payload), to: GetCreditLine, as: :execute

  @doc """
  Update a credit line.
  """
  defdelegate update_credit_line(payload), to: UpdateCreditLine, as: :execute

  @doc """
  Cancel a credit line.
  """
  defdelegate cancel_credit_line(payload), to: CancelCreditLine, as: :execute
end
