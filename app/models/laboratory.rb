class Laboratory < ApplicationRecord
  WHITELISTED_ATTRIBUTES = %i[
    name
    description
    building_number
  ].freeze

  has_many :assets
end
