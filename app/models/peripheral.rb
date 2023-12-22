class Peripheral < ApplicationRecord
  belongs_to :computer

  WHITELISTED_ATTRIBUTES = %i[
    name
    description
    computer_id
  ].freeze

  validates_presence_of :name, :description, :computer_id
end
