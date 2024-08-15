defmodule PomeloEx.Identity.KYC do
  @moduledoc """
  The Identity service lets you manage your users’ onboarding process in a flexible and simple manner, confirming their identity and preventing fraud.
  """

  alias PomeloEx.Identity.KYC.CancelSession
  alias PomeloEx.Identity.KYC.ClearUserTestEnvironment
  alias PomeloEx.Identity.KYC.CreateSession
  alias PomeloEx.Identity.KYC.GetSession
  alias PomeloEx.Identity.KYC.ObtainingSessionReport
  alias PomeloEx.Identity.KYC.SearchSession
  alias PomeloEx.Identity.KYC.UploadFile

  defdelegate cancel_session(payload), to: CancelSession, as: :execute
  defdelegate clear_user_test_environment(payload), to: ClearUserTestEnvironment, as: :execute
  defdelegate create_session(payload), to: CreateSession, as: :execute
  defdelegate get_session(payload), to: GetSession, as: :execute
  defdelegate obtaining_session_report(payload), to: ObtainingSessionReport, as: :execute
  defdelegate search_session(payload), to: SearchSession, as: :execute
  defdelegate upload_file(payload), to: UploadFile, as: :execute
end
