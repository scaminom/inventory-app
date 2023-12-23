class Asset < ApplicationRecord
  has_many :suggestions
  WHITELISTED_ATTRIBUTES = %i[
    name
    description
    stock
    amount
    computer_id
    custodian_id
    laboratory_id
  ].freeze
  
  belongs_to :computer, optional: true
  belongs_to :custodian
  belongs_to :laboratory
end
