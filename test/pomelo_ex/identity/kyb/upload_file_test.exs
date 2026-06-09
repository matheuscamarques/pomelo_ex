defmodule PomeloEx.Identity.KYB.UploadFileTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Identity.KYB.UploadFile
  alias PomeloEx.Identity.KYBFixtures

  test "Success 201 - Upload File" do
    payload = KYBFixtures.upload_file_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/identity/v1/sessions/#{payload.session_id}/entities/#{payload.company_id}/files/#{payload.type_document}"

      assert {:multipart, [{:file, file_path, _, _}]} = body
      assert file_path == payload.file_path

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 201,
         body: "{}"
       }}
    end)

    {:ok, response} = UploadFile.execute(payload)
    assert response.status == 201
  end
end
