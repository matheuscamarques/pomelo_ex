defmodule PomeloEx.General.UsersFixtures do
  @moduledoc false

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
end
