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

  defdelegate cancel_credit_line(payload), to: CancelCreditLine, as: :execute
  defdelegate create_credit_line(payload), to: CreateCreditLine, as: :execute
  defdelegate create_price_update(payload), to: CreatePriceUpdate, as: :execute
  defdelegate create_product(payload), to: CreateProduct, as: :execute
  defdelegate deactivating_product(payload), to: DeactivatingProduct, as: :execute
  defdelegate get_credit_line(payload), to: GetCreditLine, as: :execute
  defdelegate get_credit_lines(payload), to: GetCreditLines, as: :execute
  defdelegate get_price_update_history(payload), to: GetPriceUpdateHistory, as: :execute
  defdelegate get_product(payload), to: GetProduct, as: :execute
  defdelegate get_products(payload), to: GetProducts, as: :execute
  defdelegate modify_pending_price_update(payload), to: ModifyPendingPriceUpdate, as: :execute
  defdelegate update_credit_line(payload), to: UpdateCreditLine, as: :execute
  defdelegate update_product(payload), to: UpdateProduct, as: :execute
end
