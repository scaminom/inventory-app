class ActivitySerializer < Panko::Serializer
  attributes :message
  has_one :actor, serializer: UserSerializer, only: %i[username first_name last_name]
  has_one :suggestion, seializer: SuggestionSerializer, only: %i[title status]
end
