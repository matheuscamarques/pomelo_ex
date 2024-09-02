defmodule PomeloEx.General.Users.CreateUserTest do
  @moduledoc false
  use ExUnit.Case
  import Mox

  alias PomeloEx.General.Users.CreateUser
  alias PomeloEx.General.UsersFixtures

  test "Success 201 - Create User" do
    payload = %PomeloEx.General.Users.CreateUser{
      name: "Diego",
      surname: "Pomelo",
      identification_type: "RG",
      identification_value: 42_345_678,
      birthdate: "1998-08-20",
      gender: "MALE",
      email: "diego.pomelo@pomelo.la",
      phone: "1123456789",
      nationality: "BRA",
      tax_condition: "VAT_REGISTERED",
      legal_address: %PomeloEx.General.Users.CreateUser.LegalAddress{
        street_name: "Av. Corrientes",
        street_number: 300,
        floor: 1,
        apartment: "A",
        zip_code: "04545041",
        neighborhood: "Villa Crespo",
        city: "CABA",
        region: "Buenos Aires",
        additional_info: "Torre 2",
        country: "BRA"
      },
      operation_country: "BRA"
    }

    expected_body = UsersFixtures.create_user_response()

    expect(HTTPMock, :post, fn _url, _body, _headers ->
      {:ok,
       %HTTPoison.Response{
         status_code: 201,
         body: expected_body
       }}
    end)

    assert {:ok, response} = CreateUser.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["email"] == payload.email
  end
end
