class SuggestionSerializer < Panko::Serializer
  attributes  :id,
              :title,
              :description,
              :status
  has_one :suggestor, serializer: UserSerializer, only: %i[username first_name last_name]
  has_one :asset,     serializer: AssetSerializer, only: %i[name]
  has_many :activities, serializer: ActivitySerializer, only: %i[actor message]
end
