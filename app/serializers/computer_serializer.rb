class ComputerSerializer < Panko::Serializer
  attributes  :id,
              :name

  has_many :peripherals, each_serializer: PeripheralSerializer
end
