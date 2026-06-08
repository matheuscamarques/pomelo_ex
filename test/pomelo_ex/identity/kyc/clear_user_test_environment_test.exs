defmodule PomeloEx.Identity.KYC.ClearUserTestEnvironmentTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Identity.KYC.ClearUserTestEnvironment
  alias PomeloEx.Identity.KYCFixtures

  test "Success 200 - Clear User Test Environment" do
    payload = KYCFixtures.clear_user_test_environment_request()

    expect(HTTPMock, :post, fn url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/clean_validations"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: "{}"
       }}
    end)

    {:ok, response} = ClearUserTestEnvironment.execute(payload)
    assert response.status_code == 200
  end
end
