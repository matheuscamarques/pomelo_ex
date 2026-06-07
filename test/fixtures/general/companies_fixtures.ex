defmodule PomeloEx.General.CompaniesFixtures do
  alias PomeloEx.Types.General.Companies.CreateCompanyLegalAddressType
  alias PomeloEx.Types.General.Companies.CreateCompanyType
  alias PomeloEx.Types.General.Companies.GetCompanyType
  alias PomeloEx.Types.General.Companies.ModifyCompanyType
  alias PomeloEx.Types.General.Companies.SearchCompaniesType

  def create_company_request do
    %CreateCompanyType{
      token: "fRwX12Dg3345AD",
      legal_name: "Pomelo Latam S.A.",
      trade_name: "Pomelo",
      tax_identification_type: "CNPJ",
      tax_identification_value: "43.856.175/0001-08",
      email: "diego.pomelo@pomelo.la",
      phone: "1123456789",
      type: "FINTECH",
      tax_condition: "VAT_REGISTERED",
      legal_address: %CreateCompanyLegalAddressType{
        street_name: "Av. Paulista",
        street_number: "1000",
        floor: "10",
        apartment: "A",
        zip_code: "01310-100",
        neighborhood: "Bela Vista",
        city: "São Paulo",
        region: "SP",
        additional_info: "Edifício Paulista",
        country: "BRA"
      },
      operation_country: "BRA"
    }
  end

  def search_companies_request(params \\ %{}) do
    Map.merge(%SearchCompaniesType{token: "fRwX12Dg3345AD"}, params)
  end

  def get_company_request do
    %GetCompanyType{token: "fRwX12Dg3345AD", id: "com-2lWyhVOQarR8I5te2XNXdMleSEu"}
  end

  def modify_company_request do
    %ModifyCompanyType{
      token: "fRwX12Dg3345AD",
      id: "com-2lWyhVOQarR8I5te2XNXdMleSEu",
      status: "BLOCKED",
      status_reason: "CLIENT_INTERNAL_REASON"
    }
  end

  def create_company_response do
    ~s|
        {
          "data": {
            "id": "com-2lWyhVOQarR8I5te2XNXdMleSEu",
            "legal_name": "Pomelo Latam S.A.",
            "trade_name": "Pomelo",
            "tax_identification_type": "CNPJ",
            "tax_identification_value": "43.856.175/0001-08",
            "email": "diego.pomelo@pomelo.la",
            "phone": "1123456789",
            "status": "ACTIVE",
            "operation_country": "BRA",
            "legal_address": {
              "street_name": "Av. Paulista",
              "street_number": "1000",
              "floor": "10",
              "apartment": "A",
              "zip_code": "01310-100",
              "neighborhood": "Bela Vista",
              "city": "São Paulo",
              "region": "SP",
              "additional_info": "Edifício Paulista",
              "country": "BRA"
            },
            "type": "FINTECH",
            "tax_condition": "VAT_REGISTERED"
          }
        }
    |
  end

  def search_companies_response do
    ~s|
        {
          "data": [
            {
              "id": "com-2lWyhVOQarR8I5te2XNXdMleSEu",
              "legal_name": "Pomelo Latam S.A.",
              "trade_name": "Pomelo",
              "tax_identification_type": "CNPJ",
              "tax_identification_value": "43.856.175/0001-08",
              "email": "diego.pomelo@pomelo.la",
              "phone": "1123456789",
              "status": "ACTIVE",
              "operation_country": "BRA",
              "legal_address": {
                "street_name": "Av. Paulista",
                "street_number": "1000",
                "floor": "10",
                "apartment": "A",
                "zip_code": "01310-100",
                "neighborhood": "Bela Vista",
                "city": "São Paulo",
                "region": "SP",
                "additional_info": "Edifício Paulista",
                "country": "BRA"
              },
              "type": "FINTECH",
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

  def get_company_response do
    ~s|
        {
          "data": {
            "id": "com-2lWyhVOQarR8I5te2XNXdMleSEu",
            "legal_name": "Pomelo Latam S.A.",
            "trade_name": "Pomelo",
            "tax_identification_type": "CNPJ",
            "tax_identification_value": "43.856.175/0001-08",
            "email": "diego.pomelo@pomelo.la",
            "phone": "1123456789",
            "status": "ACTIVE",
            "operation_country": "BRA",
            "legal_address": {
              "street_name": "Av. Paulista",
              "street_number": "1000",
              "floor": "10",
              "apartment": "A",
              "zip_code": "01310-100",
              "neighborhood": "Bela Vista",
              "city": "São Paulo",
              "region": "SP",
              "additional_info": "Edifício Paulista",
              "country": "BRA"
            },
            "type": "FINTECH",
            "tax_condition": "VAT_REGISTERED"
          }
        }
    |
  end

  def modify_company_response do
    ~s|
        {
          "data": {
            "id": "com-2lWyhVOQarR8I5te2XNXdMleSEu",
            "legal_name": "Pomelo Latam S.A.",
            "trade_name": "Pomelo",
            "tax_identification_type": "CNPJ",
            "tax_identification_value": "43.856.175/0001-08",
            "email": "diego.pomelo@pomelo.la",
            "phone": "1123456789",
            "status": "BLOCKED",
            "operation_country": "BRA",
            "legal_address": {
              "street_name": "Av. Paulista",
              "street_number": "1000",
              "floor": "10",
              "apartment": "A",
              "zip_code": "01310-100",
              "neighborhood": "Bela Vista",
              "city": "São Paulo",
              "region": "SP",
              "additional_info": "Edifício Paulista",
              "country": "BRA"
            },
            "type": "FINTECH",
            "tax_condition": "VAT_REGISTERED"
          }
        }
    |
  end
end
