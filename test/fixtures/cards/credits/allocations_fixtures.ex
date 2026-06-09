defmodule PomeloEx.Cards.Credits.AllocationsFixtures do
  alias PomeloEx.Types.Cards.Credits.Allocations.CancelAllocationType
  alias PomeloEx.Types.Cards.Credits.Allocations.GenerateAllocationType
  alias PomeloEx.Types.Cards.Credits.Allocations.ObtainAllocationType
  alias PomeloEx.Types.Cards.Credits.Allocations.ObtainAllocationsType
  alias PomeloEx.Types.Cards.Credits.Allocations.UpdateTicketType

  def generate_allocation_request do
    %GenerateAllocationType{
      token: "fRwX12Dg3345AD",
      body: %{
        "credit_line_id" => "lcr-h4xWg6e8CiRcpHd8A6JE8MW8wSZ",
        "type" => "PAYMENT",
        "amount" => "737.94",
        "currency" => "BRL",
        "operation_date" => "2022-08-03T15:07:09Z",
        "description" => "BILL PAYMENT",
        "external_id" => "90bd079e-3c60-4896-a12f-1c08dff488ea"
      }
    }
  end

  def generate_allocation_response do
    ~s|
      {
        "id": "lco-edeESDira4dpZv8nZ6vwMb8Kjyf",
        "credit_line_id": "lcr-h4xWg6e8CiRcpHd8A6JE8MW8wSZ",
        "external_id": "90bd079e-3c60-4896-a12f-1c08dff488ea",
        "operation_date": "2022-08-03T15:07:09",
        "creation_date": "2022-08-03T15:07:09",
        "type": "PAYMENT",
        "amount": "737.94",
        "currency": "BRL",
        "description": "BILL PAYMENT",
        "status": "CREATED"
      }
    |
  end

  def obtain_allocation_request do
    %ObtainAllocationType{
      token: "fRwX12Dg3345AD",
      id: "lco-edeESDira4dpZv8nZ6vwMb8Kjyf"
    }
  end

  def obtain_allocation_response do
    ~s|
      {
        "data": {
          "id": "lco-edeESDira4dpZv8nZ6vwMb8Kjyf",
          "credit_line_id": "lcr-h4xWg6e8CiRcpHd8A6JE8MW8wSZ",
          "type": "PAYMENT",
          "amount": "737.94",
          "currency": "BRL",
          "status": "CREATED"
        }
      }
    |
  end

  def obtain_allocations_request do
    %ObtainAllocationsType{
      token: "fRwX12Dg3345AD",
      filter_credit_line_id: "lcr-h4xWg6e8CiRcpHd8A6JE8MW8wSZ"
    }
  end

  def obtain_allocations_response do
    ~s|
      {
        "data": [
          {
            "id": "lco-edeESDira4dpZv8nZ6vwMb8Kjyf",
            "credit_line_id": "lcr-h4xWg6e8CiRcpHd8A6JE8MW8wSZ",
            "type": "PAYMENT",
            "amount": "737.94",
            "currency": "BRL",
            "status": "CREATED"
          }
        ],
        "meta": {
          "pagination": {
            "total_page": 2,
            "current_page": 0,
            "page_size": 10
          }
        }
      }
    |
  end

  def update_ticket_request do
    %UpdateTicketType{
      token: "fRwX12Dg3345AD",
      credit_line_id: "lcr-h4xWg6e8CiRcpHd8A6JE8MW8wSZ",
      body: %{"amount" => "1000.00"}
    }
  end

  def update_ticket_response do
    ~s|
      {
        "data": {
          "due_date": "2023-05-05",
          "deadline_payment": "2023-05-30",
          "amount": "1000.00",
          "barcode": "12345678901234567890"
        }
      }
    |
  end

  def cancel_allocation_request do
    %CancelAllocationType{
      token: "fRwX12Dg3345AD",
      id: "lco-edeESDira4dpZv8nZ6vwMb8Kjyf"
    }
  end

  def cancel_allocation_response do
    ~s|
      {
        "data": {
          "id": "lco-edeESDira4dpZv8nZ6vwMb8Kjyf",
          "credit_line_id": "lcr-h4xWg6e8CiRcpHd8A6JE8MW8wSZ",
          "type": "PAYMENT",
          "amount": "737.94",
          "currency": "BRL",
          "status": "CANCELLED"
        }
      }
    |
  end
end
