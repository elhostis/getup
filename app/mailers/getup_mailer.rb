class GetupMailer < ActionMailer::Base
  default from: ::Rails.application.config.from

  def contact_email(contact)
  	# To actvate smtp low security of gmail
  	# https://support.google.com/accounts/answer/6010255
  	@contact = contact
    mail(to: ::Rails.application.config.destinataire, subject: "[GETUP] Nouveau contact", delivery_method_options: ::Rails.application.config.smtp_settings)
  end
end