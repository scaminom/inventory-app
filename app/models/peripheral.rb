class Peripheral < ApplicationRecord
  belongs_to :computer, optional: true
  belongs_to :asset, optional: true

  WHITELISTED_ATTRIBUTES = %i[
    name
    description
    computer_id
    asset_id
  ].freeze

  validates_presence_of :name, :description
end
