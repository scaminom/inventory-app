class UserSerializer < Panko::Serializer
  attributes  :id,
              :username,
              :email,
              :role,
              :first_name,
              :last_name
end
