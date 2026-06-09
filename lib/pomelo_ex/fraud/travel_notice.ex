defmodule PomeloEx.Fraud.TravelNotice do
  @moduledoc """
  The Travel Notice service allows you to temporarily increase transaction limits
  for users when they make purchases abroad.

  Want to know more about travel notices? Check out our
  [documentation](https://docs.pomelo.la/docs/fraud/travel-notice).
  """
  alias PomeloEx.Fraud.TravelNotice.CreateTravelNotice
  alias PomeloEx.Fraud.TravelNotice.GetTravelNotice
  alias PomeloEx.Fraud.TravelNotice.UpdateTravelNotice

  @doc """
  Create a travel notice for a user.
  """
  defdelegate create_travel_notice(payload), to: CreateTravelNotice, as: :execute

  @doc """
  Get the active travel notice for a user.
  """
  defdelegate get_travel_notice(payload), to: GetTravelNotice, as: :execute

  @doc """
  Update a travel notice (expire early, extend, or change countries).
  """
  defdelegate update_travel_notice(payload), to: UpdateTravelNotice, as: :execute
end
