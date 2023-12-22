class Custodian < ApplicationRecord
  WHITELISTED_ATTRIBUTES = %i[
    first_name
    last_name
    degree
    supervisor_id
  ].freeze

  belongs_to :supervisor, class_name: 'User', foreign_key: 'supervisor_id'
  has_many   :assets
end
