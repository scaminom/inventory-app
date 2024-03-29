class Asset < ApplicationRecord
  WHITELISTED_ATTRIBUTES = %i[
    name
    description
    stock
    amount
    computer_id
    custodian_id
    custodian_type
    laboratory_id
    peripheral_id
  ].freeze

  belongs_to :computer, optional: true
  belongs_to :custodian, polymorphic: true
  belongs_to :laboratory, optional: true
  has_many   :peripherals
end
