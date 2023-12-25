class Activity < ApplicationRecord
  WHITELISTED_ATTRIBUTES = %i[
    suggestion_id
  ]

  belongs_to :actor, polymorphic: true
  belongs_to :suggestion
end
