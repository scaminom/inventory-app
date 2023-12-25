class Assignment < ApplicationRecord
  WHITELISTED_ATTRIBUTES = %i[
    user_id
    role_id
  ].freeze

  belongs_to :user
  belongs_to :role
end
