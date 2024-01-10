class AssetSerializer < Panko::Serializer
  attributes  :id,
              :name,
              :description,
              :stock,
              :amount

  has_one :laboratory,  serializer: LaboratorySerializer,  only: %i[id name description]
  has_one :computer,    serializer: ComputerSerializer,    only: %i[id name]
  has_one :custodian,   serializer: UserSerializer,        only: %i[id username first_name last_name]
  has_many :peripherals, serializer: PeripheralSerializer, only: %i[id name computer_id]
end
