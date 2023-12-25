class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :database_authenticatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  WHITELISTED_ATTRIBUTES = %i[
    username
    email
    password
    first_name
    last_name
  ].freeze

  has_many :custodians, class_name: 'User', foreign_key: 'manager_id'
  has_many :assignments
  has_many :roles, through: :assignments
  has_many :activities, as: :actor
  has_many :suggestions, as: :suggestor
  has_many :assets, as: :custodian
  belongs_to :manager, class_name: 'User', optional: true

  def jwt_payload
    super
  end
end
