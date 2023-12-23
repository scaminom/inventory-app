class Activity < ApplicationRecord
  
  WHITELISTED_ATTRIBUTES = %i[
     description
     status
     activity_id
    ].freeze
    belongs_to :suggestion
end
