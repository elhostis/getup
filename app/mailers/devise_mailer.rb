class DeviseMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`

  def reset_password_instructions(record, token, opts={})
    organisation = Organisation.first
    url = URI::join(organisation.url, "/users/password/edit?reset_password_token=#{token}").to_s
    Rails.logger.application.info("Reset url = #{url} for user id = #{record.id}")
    Mailing.send_mail(organisation, 'reset_password_instruction', record, {:manifold => record, :url => url})
  end
end
