class Suggestion < ApplicationRecord
    belongs_to :asset
    WHITELISTED_ATTRIBUTES = %i[
     title
     description
     asset_id
    ].freeze
end
