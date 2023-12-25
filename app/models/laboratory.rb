class Laboratory < ApplicationRecord
  WHITELISTED_ATTRIBUTES = %i[
    name
    description
  ].freeze

  has_many :assets
end
