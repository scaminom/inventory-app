class PeripheralSerializer < Panko::Serializer
  attributes  :id,
              :name,
              :description,
              :computer_id,
              :asset_id
end
