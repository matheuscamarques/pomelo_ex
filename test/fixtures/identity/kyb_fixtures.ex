defmodule PomeloEx.Identity.KYBFixtures do
  alias PomeloEx.Types.Identity.KYB.CancelSessionType
  alias PomeloEx.Types.Identity.KYB.CreateSessionAdditionalType
  alias PomeloEx.Types.Identity.KYB.CreateSessionType
  alias PomeloEx.Types.Identity.KYB.GetSessionType
  alias PomeloEx.Types.Identity.KYB.ObtainingSessionReportType
  alias PomeloEx.Types.Identity.KYB.SearchSessionType
  alias PomeloEx.Types.Identity.KYB.UploadFileType

  def create_session_request do
    %CreateSessionType{
      token: "fRwX12Dg3345AD",
      company_id: "com-2lWyhVOQarR8I5te2XNXdMleSEu",
      flow_id: "flo-3ijPOgbwKFkmUjEnE4vM9IMea78",
      external_id: "ext-12345"
    }
  end

  def create_session_additional_request do
    %CreateSessionAdditionalType{
      token: "fRwX12Dg3345AD",
      user_id: "usr-2lWyhVOQarR8I5te2XNXdMleSEu",
      company_id: "com-2lWyhVOQarR8I5te2XNXdMleSEu",
      flow_id: "flo-3ijPOgbwKFkmUjEnE4vM9IMea78",
      external_id: "ext-12345"
    }
  end

  def upload_file_request do
    %UploadFileType{
      token: "fRwX12Dg3345AD",
      session_id: "ses-12345",
      company_id: "com-2lWyhVOQarR8I5te2XNXdMleSEu",
      type_document: "company-document",
      file_path: "test/fixtures/identity/test_company_doc.pdf"
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
            "company_id": "com-2lWyhVOQarR8I5te2XNXdMleSEu",
            "flow_id": "flo-3ijPOgbwKFkmUjEnE4vM9IMea78"
          }
        }
    |
  end

  def create_session_additional_response do
    ~s|
        {
          "data": {
            "id": "ses-12346",
            "status": "IN_PROGRESS",
            "user_id": "usr-2lWyhVOQarR8I5te2XNXdMleSEu",
            "company_id": "com-2lWyhVOQarR8I5te2XNXdMleSEu",
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
            "company_id": "com-2lWyhVOQarR8I5te2XNXdMleSEu",
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
            "company_id": "com-2lWyhVOQarR8I5te2XNXdMleSEu",
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
              "company_id": "com-2lWyhVOQarR8I5te2XNXdMleSEu",
              "flow_id": "flo-3ijPOgbwKFkmUjEnE4vM9IMea78"
            }
          ]
        }
    |
  end
end
