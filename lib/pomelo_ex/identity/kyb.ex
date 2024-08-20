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

  @doc """
  Create session
  The identity/v2/sessions endpoint allows you to create a new identity validation session for Legal Entities, based on one of our validation flows, and returns a unique identifier for it.
  """
  defdelegate create_session(payload), to: CreateSession, as: :execute

  @doc """
  Create session - Additional
  The identity/v2/sessions endpoint allows you to create a new identity validation session for natural persons (employee), associated with the Company which was previously validated.
  """
  defdelegate create_session_additional(payload), to: CreateSessionAdditional, as: :execute

  @doc """
  Upload File
  The identity/v1/sessions/{session_id}/entities/{user_id or company_id}/files/{type_document} endpoint will be used with the “Session Creation” ones. The purpose is to be able to upload the supporting documents that are needed depending on each type of session.

  The supported documents are:

  For Argentina

  selfie: photo of the person's face requesting session validation.

    - identity-card-front: frontal photo of the identification document.
    - identity-card-back: backside photo of the identification document.
    - company-document: according to the Company type, different types of documentation will be required.

  For Brazil

  selfie: photo of the person's face requesting session validation.

    - identity-card-front: frontal photo of the identification document.
    - identity-card-back: backside photo of the identification document.
    - driver-license-front: frontal photo of the driver's license.
    - driver-license-back: backside photo of the driver's license.
    - company-document: Articles of incorporation, statute, subscription bulletin, Articles of incorporation with sworn translation or updated document with a registration that proves the constitution of the company.
  """
  defdelegate upload_file(payload), to: UploadFile, as: :execute

  @doc """
  Cancel Session
  The identity/v1/sessions/{session_id} endpoint lets you cancel an identity validation session.
  """
  defdelegate cancel_session(payload), to: CancelSession, as: :execute

  @doc """
  Get session
  The identity/v1/session/{session_id} endpoint lets you get data from an identity validation session.
  """
  defdelegate get_session(payload), to: GetSession, as: :execute

  @doc """
  Obtaining a Session Report
  The identity/v1/sessions/{session_id}/report endpoint lets you obtain the data collected from company in an identity validation session.
  """
  defdelegate obtaining_session_report(payload), to: ObtainingSessionReport, as: :execute

  @doc """
  Search session
  The /sessions endpoint allow you to perform a search with [specific filters](https://developers.pomelo.la/api-reference/filters).

  Date range#
  There is a filter for the created_at field, which can be used to get sessions created within a date range. For example: filter[created_at][from]=2021-07-27&filter[created_at][to]=2021-07-28
  """
  defdelegate search_session(payload), to: SearchSession, as: :execute
end
