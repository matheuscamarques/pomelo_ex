defmodule PomeloEx.Cards.Associations.LineAssociationsFixtures do
  alias PomeloEx.Types.Cards.Associations.AssociateCredit.AssociateCardWithLineOfCreditType
  alias PomeloEx.Types.Cards.Associations.AssociateCredit.GetAssociationsByCreditLineType
  alias PomeloEx.Types.Cards.Associations.AssociateCredit.GetAssociationsType

  def associate_card_with_line_of_credit_request do
    %AssociateCardWithLineOfCreditType{
      token: "fRwX12Dg3345AD",
      card_id: "crd-20gRqyp809SvDzXzhSeG2w6UiO5",
      credit_line_id: "lcr-20MpN8vmIPj77ujhb9cS8ctstN2"
    }
  end

  def associate_card_with_line_of_credit_response do
    ~s|
      {
        "data": {
          "id": "lca-20gRqyp809SvDzXzhSeG2w6UiO5",
          "credit_line_id": "lcr-20MpN8vmIPj77ujhb9cS8ctstN2",
          "card_id": "crd-20gRqyp809SvDzXzhSeG2w6UiO5",
          "creation_date": "2022-07-09T14:15:07"
        }
      }
    |
  end

  def get_associations_by_credit_line_request do
    %GetAssociationsByCreditLineType{
      token: "fRwX12Dg3345AD",
      filter_credit_line_id: "lcr-20MpN8vmIPj77ujhb9cS8ctstN2"
    }
  end

  def get_associations_by_credit_line_response do
    ~s|
      {
        "data": [
          {
            "id": "lca-20gRqyp809SvDzXzhSeG2w6UiO5",
            "credit_line_id": "lcr-20MpN8vmIPj77ujhb9cS8ctstN2",
            "card_id": "crd-20gRqyp809SvDzXzhSeG2w6UiO5",
            "creation_date": "2022-07-09T14:15:07"
          }
        ]
      }
    |
  end

  def get_associations_request do
    %GetAssociationsType{
      token: "fRwX12Dg3345AD",
      id: "lca-20gRqyp809SvDzXzhSeG2w6UiO5"
    }
  end

  def get_associations_response do
    ~s|
      {
        "data": {
          "id": "lca-20gRqyp809SvDzXzhSeG2w6UiO5",
          "credit_line_id": "lcr-20MpN8vmIPj77ujhb9cS8ctstN2",
          "card_id": "crd-20gRqyp809SvDzXzhSeG2w6UiO5",
          "creation_date": "2022-07-09T14:15:07"
        }
      }
    |
  end
end
