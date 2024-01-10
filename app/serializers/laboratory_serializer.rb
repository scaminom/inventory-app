class LaboratorySerializer < Panko::Serializer
  attributes  :id,
              :name,
              :description,
              :building_number
  has_many :assets, each_serializer: AssetSerializer
end
