class ComputerSerializer < Panko::Serializer
  attributes  :id,
              :name,
              :description

  has_many :peripherals, each_serializer: PeripheralSerializer
end
