require "active_model"
require "active_support/core_ext"
require 'httparty'
require 'uri'

class EmailFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # return if value.blank?
    # response = HTTParty.get("#{::Rails.application.config.validation_api_url}/services/email/validation/#{URI.escape(value)}")
    # record.errors.add attribute, I18n.t('user.error.invalid_email') if response["status"] == "KO"
  end
end

class User < ActiveRecord::Base
  include ActiveModel::Validations
  include Filterable

  # Default ordering
  default_scope { order(' users.created_at DESC') }

  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  #Validations
  validates :email, :email_format => true

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable, :lockable, :omniauthable

  #
  # Automatic account activation
  #
  def active_for_authentication?
    true
  end

end
