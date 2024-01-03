class AssetSerializer < Panko::Serializer
  attributes  :id,
              :name,
              :description,
              :stock,
              :amount

  has_one :laboratory,  serializer: LaboratorySerializer,  only: %i[name description]
  has_one :computer,    serializer: ComputerSerializer,    only: %i[name]
  has_one :custodian,   serializer: UserSerializer,        only: %i[username first_name last_name]
end
