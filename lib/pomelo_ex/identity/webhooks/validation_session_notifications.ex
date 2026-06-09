defmodule PomeloEx.Identity.Webhooks.ValidationSessionNotifications do
  @moduledoc """
  Webhook handler for identity validation session notifications.

  Receives notifications when a KYC/KYB identity validation session is processed or completed.
  Headers include digital signature for verification (X-Api-Key, X-Signature, X-Timestamp, X-Endpoint).

  You must respond with a 2xx HTTP status code, otherwise the notification will be resent.
  """

  def execute(_payload) do
    {:ok, %{status: 200}}
  end
end
