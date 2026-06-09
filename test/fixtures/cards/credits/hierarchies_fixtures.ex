defmodule PomeloEx.Cards.Credits.HierarchiesFixtures do
  alias PomeloEx.Types.Cards.Credits.Hierarchies.CreateNodeType
  alias PomeloEx.Types.Cards.Credits.Hierarchies.GetNodeType
  alias PomeloEx.Types.Cards.Credits.Hierarchies.UpdateNodeType

  def create_node_request do
    %CreateNodeType{
      token: "fRwX12Dg3345AD",
      hierarchy_id: "hie-2HMwKzetERdOEhbT86UweXamPle",
      body: %{
        "type" => "COMPANY_AREA",
        "parent_node_id" => "nod-2HMvSDccc5PZzCvZ98lfeXamPle",
        "name" => "Marketing Hierarchy",
        "credit_config" => %{
          "limits" => %{
            "ownership" => "OWNED",
            "currency" => "PEN",
            "type" => "SINGLE_LIMIT",
            "single_payment" => %{"limit" => 4000},
            "installments" => %{"limit" => 4000},
            "cash_advance" => %{"limit" => 4000, "percentage" => 5}
          }
        }
      }
    }
  end

  def create_node_response do
    ~s|
      {
        "id": "nod-2HMwKzetERdOEhbT86UweXamPle",
        "parent_node_id": "nod-2HMvSDccc5PZzCvZ98lfeXamPle",
        "name": "Marketing Hierarchy",
        "type": "COMPANY",
        "status": "PENDING"
      }
    |
  end

  def get_node_request do
    %GetNodeType{
      token: "fRwX12Dg3345AD",
      hierarchy_id: "hie-2HMwKzetERdOEhbT86UweXamPle",
      node_id: "nod-2HMwKzetERdOEhbT86UweXamPle"
    }
  end

  def get_node_response do
    ~s|
      {
        "data": {
          "id": "nod-2HMwKzetERdOEhbT86UweXamPle",
          "parent_node_id": "nod-2HMvSDccc5PZzCvZ98lfeXamPle",
          "name": "Marketing Hierarchy",
          "type": "COMPANY",
          "status": "PENDING"
        }
      }
    |
  end

  def update_node_request do
    %UpdateNodeType{
      token: "fRwX12Dg3345AD",
      hierarchy_id: "hie-2HMwKzetERdOEhbT86UweXamPle",
      node_id: "nod-2HMwKzetERdOEhbT86UweXamPle",
      body: %{
        "status" => "ACTIVE",
        "credit_config" => %{
          "limits" => %{
            "ownership" => "OWNED",
            "single_payment" => %{"limit" => 5000}
          }
        }
      }
    }
  end

  def update_node_response do
    ~s|
      {
        "data": {
          "id": "nod-2HMwKzetERdOEhbT86UweXamPle",
          "status": "ACTIVE"
        }
      }
    |
  end
end
