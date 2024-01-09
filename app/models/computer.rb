class Computer < ApplicationRecord
  has_many :peripherals
  has_many :assets

  WHITELISTED_ATTRIBUTES = %i[
    name
    description
    code
  ].freeze

  validates_presence_of :name, :description, :code
end
