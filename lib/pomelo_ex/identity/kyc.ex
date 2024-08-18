defmodule PomeloEx.Identity.KYC do
  @moduledoc """
  The Identity service lets you manage your users’ onboarding process in a flexible and simple manner, confirming their identity and preventing fraud.
  """

  @doc """
  Create session
  The identity/v2/sessions endpoint allows you to create a new identity validation session for Individuals, based on one of our validation flows, and returns a unique identifier for it.

  Consideration about the API integration method
  When this type of integration is used, the documents are uploaded with the following endpoint [Upload File](https://developers.pomelo.la/api-reference/Identity/kyc#subir-archivo).
  """
  alias PomeloEx.Identity.KYC.CreateSession
  defdelegate create_session(payload), to: CreateSession, as: :execute

  @doc """
  Upload File
  The identity/v1/sessions/{session_id}/entities/{user_id}/files/{type_document} endpoint will be used with the “Session Creation” ones. The purpose is to be able to upload the supporting documents that are needed depending on each type of session.

  The supported documents are:

  For Argentina

  selfie: Picture of the person's face who wants to validate the session.

    - identity-card-front: Photo of the front of the identity document.
    - identity-card-back: Photo of the back of the identity document.

  For Brazil

  selfie: Picture of the person's face who wants to validate the session.

    - identity-card-front: Photo of the front of the identity document.
    - identity-card-back: Photo of the back of the identity document.
    - driver-license-front: Photo of the front of the driver's license.
    - driver-license-back: Photo of the back of the driver's license.
  """
  alias PomeloEx.Identity.KYC.UploadFile
  defdelegate upload_file(payload), to: UploadFile, as: :execute

  @doc """
  Clear user in test environment
  The endpoint /clean_validations allows you to “clear” user data in a test environment, so you can create a new version with the same document.

  Considerations
  You will have to specify the ID or document number of the user you want to clear. If you send them both, the user ID will be used as priority to clear data.
  """
  alias PomeloEx.Identity.KYC.ClearUserTestEnvironment
  defdelegate clear_user_test_environment(payload), to: ClearUserTestEnvironment, as: :execute

  @doc """
  Cancel Session
  The identity/v1/sessions/{session_id} endpoint lets you cancel an identity validation session.
  """
  alias PomeloEx.Identity.KYC.CancelSession
  defdelegate cancel_session(payload), to: CancelSession, as: :execute

  @doc """
  Get session
  The identity/v1/session/{session_id} endpoint lets you get data from an identity validation session.
  """
  alias PomeloEx.Identity.KYC.GetSession
  defdelegate get_session(payload), to: GetSession, as: :execute

  @doc """
  Obtaining a Session Report
  The identity/v1/sessions/{session_id}/report endpoint lets you obtain a user's data collected in an identity validation session.
  """
  alias PomeloEx.Identity.KYC.ObtainingSessionReport
  defdelegate obtaining_session_report(payload), to: ObtainingSessionReport, as: :execute

  @doc """
  Search session
  The /sessions endpoint allow you to perform a search with specific filters.

  Considerations
  Filters must be specified as parameters following this pattern: filter[field]=value. For example: filter[status]=IN_PROGRESS

  The results will be paginated and you can specify the amount of data per page and also which page you wish to view.

  Date range
  There is a filter for the created_at field, which can be used to get sessions created within a date range. For example: filter[created_at][from]=2021-07-27&filter[created_at][to]=2021-07-28

  Sorting
  You can specify the order of the results with certain parameters that you must send as list of strings in the sort filter type. For example: ?sort=created_at,updated_at.

  The default sorting will be ascending. To specify a descending sorting, you must send the character '-' as a prefix of the attribute. For example: ?sort=created_at,-updated_at.

  If a parameter is incorrect or misspelled, it will return an error.
  """
  alias PomeloEx.Identity.KYC.SearchSession
  defdelegate search_session(payload), to: SearchSession, as: :execute
end
