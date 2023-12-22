class AssetSerializer < Panko::Serializer
  attributes  :id,
              :name,
              :description,
              :stock,
              :amount

  has_one :laboratory,  serializer: LaboratorySerializer,  only: %i[name description]
  has_one :custodian,   serializer: CustodianSerializer,   only: %i[first_name last_name]
  has_one :computer,    serializer: ComputerSerializer,    only: %i[name]
end
