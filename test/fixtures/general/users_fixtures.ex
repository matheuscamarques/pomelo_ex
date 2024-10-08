defmodule PomeloEx.General.UsersFixtures do
  alias PomeloEx.Types.General.Users.CreateUserLegalAddressType
  alias PomeloEx.Types.General.Users.CreateUserType
  alias PomeloEx.Types.General.Users.GetUserType
  alias PomeloEx.Types.General.Users.ModifyUserType
  alias PomeloEx.Types.General.Users.SearchUserType

  def create_user_request do
    %CreateUserType{
      token: "fRwX12Dg3345AD",
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
      legal_address: %CreateUserLegalAddressType{
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
  end

  def search_user_request(params \\ %{}) do
    Map.merge(%SearchUserType{token: "fRwX12Dg3345AD"}, params)
  end

  def get_user_request do
    %GetUserType{token: "fRwX12Dg3345AD", id: "usr-2lWyhVOQarR8I5te2XNXdMleSEu"}
  end

  def modify_user_request do
    %ModifyUserType{
      token: "fRwX12Dg3345AD",
      id: "usr-2lWyhVOQarR8I5te2XNXdMleSEu",
      status: "BLOCKED",
      status_reason: "CLIENT_INTERNAL_REASON"
    }
  end

  def create_user_response do
    ~s|
        {
          "data": {
            "id": "usr-2lWyhVOQarR8I5te2XNXdMleSEu",
            "name": "Diego",
            "surname": "Pomelo",
            "identification_type": "RG",
            "identification_value": "42345678",
            "birthdate": "1998-08-20",
            "gender": "MALE",
            "email": "diego.pomelo@pomelo.la",
            "phone": "1123456789",
            "status": "ACTIVE",
            "operation_country": "BRA",
            "legal_address": {
              "floor": "1",
              "street_name": "Av. Corrientes",
              "street_number": "300",
              "apartment": "A",
              "city": "Ilhéus-Itabuna",
              "region": "BA",
              "zip_code": "4545041",
              "neighborhood": "Villa Crespo",
              "country": "BRA",
              "additional_info": "Torre 2"
            },
            "client_id": "cli-2ijPOgbwKFkmUjEnE4vM9IMea78",
            "nationality": "BRA",
            "tax_condition": "VAT_REGISTERED"
          }
        }
   |
  end

  def search_user_response do
    ~s|
        {
          "data": [
            {
              "id": "usr-2lWyhVOQarR8I5te2XNXdMleSEu",
              "name": "Diego",
              "surname": "Pomelo",
              "identification_type": "RG",
              "identification_value": "42345678",
              "birthdate": "1998-08-20",
              "gender": "MALE",
              "email": "diego.pomelo@pomelo.la",
              "phone": "1123456789",
              "status": "ACTIVE",
              "operation_country": "BRA",
              "legal_address": {
                "floor": "1",
                "street_name": "Av. Corrientes",
                "street_number": "300",
                "apartment": "A",
                "city": "Ilhéus-Itabuna",
                "region": "BA",
                "zip_code": "4545041",
                "neighborhood": "Villa Crespo",
                "country": "BRA",
                "additional_info": "Torre 2"
              },
              "client_id": "cli-2ijPOgbwKFkmUjEnE4vM9IMea78",
              "nationality": "BRA",
              "tax_condition": "VAT_REGISTERED"
            }
          ],
          "meta": {
            "pagination": {
              "total_pages": 1,
              "current_page": 0
            },
            "filters": []
          }
        }
    |
  end

  def get_user_response do
    ~s|
        {
          "data": {
            "id": "usr-2lWyhVOQarR8I5te2XNXdMleSEu",
            "name": "Diego",
            "surname": "Pomelo",
            "identification_type": "RG",
            "identification_value": "42345678",
            "birthdate": "1998-08-20",
            "gender": "MALE",
            "email": "diego.pomelo@pomelo.la",
            "phone": "1123456789",
            "status": "ACTIVE",
            "operation_country": "BRA",
            "legal_address": {
              "floor": "1",
              "street_name": "Av. Corrientes",
              "street_number": "300",
              "apartment": "A",
              "city": "Ilhéus-Itabuna",
              "region": "BA",
              "zip_code": "4545041",
              "neighborhood": "Villa Crespo",
              "country": "BRA",
              "additional_info": "Torre 2"
            },
            "client_id": "cli-2ijPOgbwKFkmUjEnE4vM9IMea78",
            "nationality": "BRA",
            "tax_condition": "VAT_REGISTERED"
          }
        }
    |
  end

  def modify_user_response do
    ~s|
        {
          "data": {
            "id": "usr-2lWyhVOQarR8I5te2XNXdMleSEu",
            "name": "Diego",
            "surname": "Pomelo",
            "identification_type": "RG",
            "identification_value": "42345678",
            "birthdate": "1998-08-20",
            "gender": "MALE",
            "email": "diego.pomelo@pomelo.la",
            "phone": "1123456789",
            "status": "BLOCKED",
            "operation_country": "BRA",
            "legal_address": {
              "floor": "1",
              "street_name": "Av. Corrientes",
              "street_number": "300",
              "apartment": "A",
              "city": "Ilhéus-Itabuna",
              "region": "BA",
              "zip_code": "4545041",
              "neighborhood": "Villa Crespo",
              "country": "BRA",
              "additional_info": "Torre 2"
            },
            "client_id": "cli-2ijPOgbwKFkmUjEnE4vM9IMea78",
            "nationality": "BRA",
            "tax_condition": "VAT_REGISTERED"
          }
        }
    |
  end
end
