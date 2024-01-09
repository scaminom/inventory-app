class ComputerSerializer < Panko::Serializer
  attributes  :id,
              :name,
              :description,
              :code

  has_many :peripherals, each_serializer: PeripheralSerializer
end
