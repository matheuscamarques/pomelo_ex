defmodule PomeloEx.Cards.Credits.AvailablePlans do
  @moduledoc """
  The Available Plans service allows you to obtain installment plans and refinancing plans for each credit line,
  facilitating the management of flexible payment options for your users.

  Want to know more about available plans? Check out our [documentation](https://developers.pomelo.la/api-reference/core-credit/available-plans).
  """
  alias PomeloEx.Cards.Credits.AvailablePlans.GetInstallmentPlans
  alias PomeloEx.Cards.Credits.AvailablePlans.GetRefinancingPlans

  @doc """
  Get all installment plans (payment plans) for a credit line.
  """
  defdelegate get_installment_plans(payload), to: GetInstallmentPlans, as: :execute

  @doc """
  Get all refinancing plans available for a credit line.
  """
  defdelegate get_refinancing_plans(payload), to: GetRefinancingPlans, as: :execute
end
