defmodule PomeloEx.Identity.Webhooks.RequiredFileNotification do
  @moduledoc """
  Webhook handler for identity required file notifications.

  Receives notifications when a required file is requested for a KYC/KYB session.
  You must respond with a 2xx HTTP status code, otherwise the notification will be resent.
  """

  def execute(_payload) do
    {:ok, %{status: 200}}
  end
end
