defmodule PomeloEx.DigitalAccounts.QueriesFixtures do
  alias PomeloEx.Types.DigitalAccounts.Queries.GetAccountType
  alias PomeloEx.Types.DigitalAccounts.Queries.ListAccountsType

  def get_account_request do
    %GetAccountType{
      token: "fRwX12Dg3345AD",
      id: "acc-20i4O5MIKHooZpOV8j5s7nxV5pl"
    }
  end

  def get_account_response do
    ~s|
      {
        "data": {
          "id": "acc-20i4O5MIKHooZpOV8j5s7nxV5pl",
          "country": "ARG",
          "balance": "982345.12",
          "data": {
            "license_owner": "POMELO",
            "bank_account": {
              "cvu": "2222222222222222222222",
              "alias": "cuenta.pomelo.ejemplo"
            }
          },
          "owner_type": "USER",
          "owner_data": {
            "user_id": "usr-20i4czXIfc1NsXAvoPoPaWBAwye",
            "client_id": "cli-20i4e72I0b0sFgN3KPewmnUGryi",
            "company_id": "cmp-20i4czXIfc1NsXAvoPoPaWBAwye"
          },
          "status": "ACTIVE",
          "currency": "ARS",
          "status_update_motive": "OTHER",
          "status_update_comment": "Comentario sobre el motivo de la actualización de la cuenta.",
          "metadata": {
            "extra_property_1": "My value"
          },
          "created_at": "2024-01-01T00:00:00Z",
          "updated_at": "2024-01-01T00:00:00Z",
          "status_updated_by": "CLIENT"
        }
      }
    |
  end

  def list_accounts_request(params \\ %{}) do
    Map.merge(
      %ListAccountsType{
        token: "fRwX12Dg3345AD",
        filter_country: "ARG"
      },
      params
    )
  end

  def list_accounts_response do
    ~s|
      {
        "meta": {
          "pagination": {
            "current_page": 5,
            "total_pages": 10,
            "page_size": 3
          }
        },
        "data": [
          {
            "id": "acc-20i4O5MIKHooZpOV8j5s7nxV5pl",
            "country": "ARG",
            "balance": "982345.12",
            "data": {
              "license_owner": "POMELO",
              "bank_account": {
                "cvu": "2222222222222222222222",
                "alias": "cuenta.pomelo.ejemplo"
              }
            },
            "owner_type": "USER",
            "owner_data": {
              "user_id": "usr-20i4czXIfc1NsXAvoPoPaWBAwye",
              "client_id": "cli-20i4e72I0b0sFgN3KPewmnUGryi",
              "company_id": "cmp-20i4czXIfc1NsXAvoPoPaWBAwye"
            },
            "status": "ACTIVE",
            "currency": "ARS",
            "status_update_motive": "OTHER",
            "status_update_comment": "Comentario sobre el motivo de la actualización de la cuenta.",
            "metadata": {
              "extra_property_1": "My value"
            },
            "created_at": "2024-01-01T00:00:00Z",
            "updated_at": "2024-01-01T00:00:00Z",
            "status_updated_by": "CLIENT"
          }
        ]
      }
    |
  end
end
