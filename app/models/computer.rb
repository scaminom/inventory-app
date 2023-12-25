class Computer < ApplicationRecord
  has_many :peripherals
  has_many :assets

  WHITELISTED_ATTRIBUTES = %i[
    name
    description
  ].freeze

  validates_presence_of :name, :description
end
