class CustodianSerializer < Panko::Serializer
  attributes  :id,
              :first_name,
              :last_name,
              :degree

  has_one :supervisor, serializer: UserSerializer, only: %i[username email]
  has_many :assets,    serializer: AssetSerializer, only: %i[name stock laboratory computer]
end
