defmodule PomeloEx.Identity.KYB do
  @moduledoc """
  The Identity service lets you manage the onboarding process of companies, partners and employees in a flexible and simple manner, confirming their identity and preventing fraud.
  """

  alias PomeloEx.Identity.KYB.CancelSession
  alias PomeloEx.Identity.KYB.CreateSession
  alias PomeloEx.Identity.KYB.CreateSessionAdditional
  alias PomeloEx.Identity.KYB.GetSession
  alias PomeloEx.Identity.KYB.ObtainingSessionReport
  alias PomeloEx.Identity.KYB.SearchSession
  alias PomeloEx.Identity.KYB.UploadFile

  defdelegate cancel_session(payload), to: CancelSession, as: :execute
  defdelegate create_session_additional(payload), to: CreateSessionAdditional, as: :execute
  defdelegate create_session(payload), to: CreateSession, as: :execute
  defdelegate get_session(payload), to: GetSession, as: :execute
  defdelegate obtaining_session_report(payload), to: ObtainingSessionReport, as: :execute
  defdelegate search_session(payload), to: SearchSession, as: :execute
  defdelegate upload_file(payload), to: UploadFile, as: :execute
end
