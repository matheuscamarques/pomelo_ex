defmodule PomeloEx.Identity.KYC.UploadFile do
  @moduledoc false

  alias PomeloEx.Types.Identity.KYC.UploadFileType

  def execute(%UploadFileType{
        token: token,
        session_id: session_id,
        user_id: user_id,
        type_document: type_document,
        file_path: file_path
      }) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = [{"Authorization", "Bearer #{token}"}]

    body =
      {:multipart,
       [
         {:file, file_path,
          {"form-data", [{"name", "file"}, {"filename", Path.basename(file_path)}]}, []}
       ]}

    http_client.post(
      "#{url}/identity/v1/sessions/#{session_id}/entities/#{user_id}/files/#{type_document}",
      body,
      headers
    )
  end
end
