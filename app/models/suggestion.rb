class Suggestion < ApplicationRecord
    has_many :activities
    WHITELISTED_ATTRIBUTES = %i[
     title
     description
     asset_id
    ].freeze
    belongs_to :asset
end
