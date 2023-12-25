class SuggestionSerializer < Panko::Serializer
  attributes  :id,
              :title,
              :description,
              :status
  has_one :suggestor, serializer: UserSerializer, only: %i[username]
  has_one :asset,     serializer: AssetSerializer, only: %i[name]
end
