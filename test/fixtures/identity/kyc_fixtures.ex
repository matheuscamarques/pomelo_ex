defmodule PomeloEx.Identity.KYCFixtures do
  alias PomeloEx.Types.Identity.KYC.CancelSessionType
  alias PomeloEx.Types.Identity.KYC.ClearUserTestEnvironmentType
  alias PomeloEx.Types.Identity.KYC.CreateSessionType
  alias PomeloEx.Types.Identity.KYC.GetSessionType
  alias PomeloEx.Types.Identity.KYC.ObtainingSessionReportType
  alias PomeloEx.Types.Identity.KYC.SearchSessionType
  alias PomeloEx.Types.Identity.KYC.UploadFileType

  def create_session_request do
    %CreateSessionType{
      token: "fRwX12Dg3345AD",
      user_id: "usr-2lWyhVOQarR8I5te2XNXdMleSEu",
      flow_id: "flo-3ijPOgbwKFkmUjEnE4vM9IMea78",
      external_id: "ext-12345"
    }
  end

  def upload_file_request do
    %UploadFileType{
      token: "fRwX12Dg3345AD",
      session_id: "ses-12345",
      user_id: "usr-2lWyhVOQarR8I5te2XNXdMleSEu",
      type_document: "selfie",
      file_path: "test/fixtures/identity/test_selfie.png"
    }
  end

  def clear_user_test_environment_request do
    %ClearUserTestEnvironmentType{
      token: "fRwX12Dg3345AD",
      user_id: "usr-2lWyhVOQarR8I5te2XNXdMleSEu"
    }
  end

  def cancel_session_request do
    %CancelSessionType{
      token: "fRwX12Dg3345AD",
      session_id: "ses-12345"
    }
  end

  def get_session_request do
    %GetSessionType{
      token: "fRwX12Dg3345AD",
      session_id: "ses-12345"
    }
  end

  def obtaining_session_report_request do
    %ObtainingSessionReportType{
      token: "fRwX12Dg3345AD",
      session_id: "ses-12345"
    }
  end

  def search_session_request(params \\ %{}) do
    Map.merge(%SearchSessionType{token: "fRwX12Dg3345AD"}, params)
  end

  def create_session_response do
    ~s|
        {
          "data": {
            "id": "ses-12345",
            "status": "IN_PROGRESS",
            "user_id": "usr-2lWyhVOQarR8I5te2XNXdMleSEu",
            "flow_id": "flo-3ijPOgbwKFkmUjEnE4vM9IMea78"
          }
        }
    |
  end

  def get_session_response do
    ~s|
        {
          "data": {
            "id": "ses-12345",
            "status": "VALIDATED",
            "user_id": "usr-2lWyhVOQarR8I5te2XNXdMleSEu",
            "flow_id": "flo-3ijPOgbwKFkmUjEnE4vM9IMea78"
          }
        }
    |
  end

  def report_response do
    ~s|
        {
          "data": {
            "session_id": "ses-12345",
            "user_id": "usr-2lWyhVOQarR8I5te2XNXdMleSEu",
            "validation_status": "SUCCESSFUL",
            "details": {}
          }
        }
    |
  end

  def search_sessions_response do
    ~s|
        {
          "data": [
            {
              "id": "ses-12345",
              "status": "IN_PROGRESS",
              "user_id": "usr-2lWyhVOQarR8I5te2XNXdMleSEu",
              "flow_id": "flo-3ijPOgbwKFkmUjEnE4vM9IMea78"
            }
          ]
        }
    |
  end
end
