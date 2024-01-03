class Suggestion < ApplicationRecord
  WHITELISTED_ATTRIBUTES = %i[
    title
    description
    asset_id
    suggestor_type
    suggestor_id
    status
  ].freeze

  belongs_to :suggestor, polymorphic: true
  belongs_to :asset

  enum status: {
    'open': 0,
    'closed': 1
  }
end
