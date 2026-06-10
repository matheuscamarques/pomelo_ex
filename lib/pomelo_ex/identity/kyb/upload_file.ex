defmodule PomeloEx.Identity.KYB.UploadFile do
  @moduledoc false

  alias PomeloEx.Types.Identity.KYB.UploadFileType

  def execute(%UploadFileType{
        token: token,
        session_id: session_id,
        company_id: company_id,
        type_document: type_document,
        file_path: file_path
      }) do
    headers = [{"Authorization", "Bearer #{token}"}]

    body =
      {:multipart,
       [
         {:file, file_path,
          {"form-data", [{"name", "file"}, {"filename", Path.basename(file_path)}]}, []}
       ]}

    PomeloEx.Client.request(
      :post,
      "/identity/v1/sessions/#{session_id}/entities/#{company_id}/files/#{type_document}",
      body,
      headers
    )
  end
end
