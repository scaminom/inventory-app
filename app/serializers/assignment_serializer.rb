class AssignmentSerializer < Panko::Serializer
  attributes :id
  has_one :user, serializer: UserSerializer, only: %i[username]
  has_one :role, serializer: RoleSerializer
end
