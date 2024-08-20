defmodule PomeloEx.Cards.Credits.CreditLines do
  @moduledoc """
  The Credit Lines service allows you to create and manage both credit products and credit lines

  Want to know more about credit lines? Check out our [documentation](https://docs.pomelo.la/docs/cards/lending/credit-line).
  """
  alias PomeloEx.Cards.Credits.CreditLines.CancelCreditLine
  alias PomeloEx.Cards.Credits.CreditLines.CreateCreditLine
  alias PomeloEx.Cards.Credits.CreditLines.CreatePriceUpdate
  alias PomeloEx.Cards.Credits.CreditLines.CreateProduct
  alias PomeloEx.Cards.Credits.CreditLines.DeactivatingProduct
  alias PomeloEx.Cards.Credits.CreditLines.GetCreditLine
  alias PomeloEx.Cards.Credits.CreditLines.GetCreditLines
  alias PomeloEx.Cards.Credits.CreditLines.GetPriceUpdateHistory
  alias PomeloEx.Cards.Credits.CreditLines.GetProduct
  alias PomeloEx.Cards.Credits.CreditLines.GetProducts
  alias PomeloEx.Cards.Credits.CreditLines.ModifyPendingPriceUpdate
  alias PomeloEx.Cards.Credits.CreditLines.UpdateCreditLine
  alias PomeloEx.Cards.Credits.CreditLines.UpdateProduct

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
  Get credit lines
  The lending/v1/products endpoint allows you to retrieve data on credit lines according to specific search criteria.

  Filters#
  You can find more information on how to apply filters in the section [Filters and pagination](https://developers.pomelo.la/api-reference/filters).
  """
  defdelegate get_credit_lines(payload), to: GetCreditLines, as: :execute

  @doc """
  Create line of credit
  The lending/v1/products endpoint allows you to create a credit line.
  """
  defdelegate create_credit_line(payload), to: CreateCreditLine, as: :execute

  @doc """
  Get line of credit
  El endpoint lending/v1/credit-lines/{id} te permite obtener datos de una línea de crédito en específico.

  En esta instancia podrás definir el límite y la fecha de cierre específicos para esta línea de crédito, siempre dentro de los parámetros que hayas definido para el producto.

  ¿Quieres conocer más sobre las líneas de crédito? Mira nuestra [documentation](https://docs.pomelo.la/docs/cards/lending/create-credit-line).
  """
  defdelegate get_credit_line(payload), to: GetCreditLine, as: :execute

  @doc """
  Update credit lines
  The lending/v1/credit-lines/{id} endpoint allows you to update data for a specific credit line.
  """
  defdelegate update_credit_line(payload), to: UpdateCreditLine, as: :execute

  @doc """
  Cancel credit lines
  The lending/v1/credit-lines/{id} endpoint allows you to cancel a credit line.
  """
  defdelegate cancel_credit_line(payload), to: CancelCreditLine, as: :execute

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
end
