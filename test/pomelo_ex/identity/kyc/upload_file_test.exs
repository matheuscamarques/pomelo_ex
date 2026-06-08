defmodule PomeloEx.Identity.KYC.UploadFileTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Identity.KYC.UploadFile
  alias PomeloEx.Identity.KYCFixtures

  test "Success 201 - Upload File" do
    payload = KYCFixtures.upload_file_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/identity/v1/sessions/#{payload.session_id}/entities/#{payload.user_id}/files/#{payload.type_document}"

      assert {:multipart, [{:file, file_path, _, _}]} = body
      assert file_path == payload.file_path

      {:ok,
       %HTTPoison.Response{
         status_code: 201,
         body: "{}"
       }}
    end)

    {:ok, response} = UploadFile.execute(payload)
    assert response.status_code == 201
  end
end
