defmodule PomeloEx.Cards.Credits.CreditProduct do
  @moduledoc """
  The Credit Product service allows you to create and manage credit products and their segments.

  Want to know more about credit products? Check out our [documentation](https://docs.pomelo.la/docs/cards/lending/credit-line).
  """
  alias PomeloEx.Cards.Credits.CreditProduct.CreatePriceUpdate
  alias PomeloEx.Cards.Credits.CreditProduct.CreateProduct
  alias PomeloEx.Cards.Credits.CreditProduct.CreateSegment
  alias PomeloEx.Cards.Credits.CreditProduct.DeactivatingProduct
  alias PomeloEx.Cards.Credits.CreditProduct.GetPriceUpdateHistory
  alias PomeloEx.Cards.Credits.CreditProduct.GetProduct
  alias PomeloEx.Cards.Credits.CreditProduct.GetProducts
  alias PomeloEx.Cards.Credits.CreditProduct.GetSegment
  alias PomeloEx.Cards.Credits.CreditProduct.GetSegmentRateUpdates
  alias PomeloEx.Cards.Credits.CreditProduct.GetSegments
  alias PomeloEx.Cards.Credits.CreditProduct.ModifyPendingPriceUpdate
  alias PomeloEx.Cards.Credits.CreditProduct.UpdateProduct
  alias PomeloEx.Cards.Credits.CreditProduct.UpdateSegment

  @doc """
  Create Product
  The lending/v1/products endpoint allows you to create a product.

  At this moment, you will be able to define the cutoff and due dates, limits and available balances, rates and fees, how the minimum payment is composed and more.
  """
  defdelegate create_product(payload), to: CreateProduct, as: :execute

  @doc """
  Get products
  The endpoint lending/v1/products allows you to retrieve data from all products created
  """
  defdelegate get_products(payload), to: GetProducts, as: :execute

  @doc """
  Get product
  The lending/v1/products/{id} endpoint allows you to retrieve data from a specific product.
  """
  defdelegate get_product(payload), to: GetProduct, as: :execute

  @doc """
  Update product
  The lending/v1/products/{id} endpoint allows you to update data for a specific product.
  """
  defdelegate update_product(payload), to: UpdateProduct, as: :execute

  @doc """
  Deactivating a product
  The endpoint lending/v1/products/{id} allows you to deactivate a specific product.
  """
  defdelegate deactivating_product(payload), to: DeactivatingProduct, as: :execute

  @doc """
  Create price update
  The /products/{product_id}/pricing endpoint allows you to create new price updates for products with ACTIVE or PAUSED status
  """
  defdelegate create_price_update(payload), to: CreatePriceUpdate, as: :execute

  @doc """
  Get price update history
  The endpoint /products/{product_id}/pricing allows you to obtain the price update history related to a product
  """
  defdelegate get_price_update_history(payload), to: GetPriceUpdateHistory, as: :execute

  @doc """
  Modify pending price update
  The endpoint /products/{product_id}/pricing/{start_date} enables you to modify a pending price update
  """
  defdelegate modify_pending_price_update(payload), to: ModifyPendingPriceUpdate, as: :execute

  @doc """
  Create segment
  The /products/{product_id}/segments endpoint allows you to create a new segment for a product with specific pricing configuration.
  """
  defdelegate create_segment(payload), to: CreateSegment, as: :execute

  @doc """
  Get segments
  The /products/{product_id}/segments endpoint allows you to retrieve all segments associated with a specific product.
  """
  defdelegate get_segments(payload), to: GetSegments, as: :execute

  @doc """
  Get segment
  The /products/{product_id}/segments/{segment_id} endpoint allows you to retrieve data from a specific segment.
  """
  defdelegate get_segment(payload), to: GetSegment, as: :execute

  @doc """
  Update segment
  The /products/{product_id}/segments/{segment_id} endpoint allows you to update settings for a specific segment.
  """
  defdelegate update_segment(payload), to: UpdateSegment, as: :execute

  @doc """
  Get segment rate updates
  The /products/{product_id}/segments/{segment_id}/pricing endpoint allows you to obtain rate updates for a segment, either applied or upcoming.
  """
  defdelegate get_segment_rate_updates(payload), to: GetSegmentRateUpdates, as: :execute
end
