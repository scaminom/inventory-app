class Role < ApplicationRecord
  WHITELISTED_ATTRIBUTES = %i[
    name
  ].freeze

  has_many :assignments
  has_many :users, through: :assignments

  enum name: {
    'GUESS': 0,
    'TECHNICIAN': 1,
    'STUDENT': 2,
    'CUSTODIAN': 3
  }.freeze

  validates :name, inclusion: { in: names.keys }
end
