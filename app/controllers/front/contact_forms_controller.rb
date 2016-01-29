class Front::ContactFormsController < FrontController
  # GET /contact_forms/new
  def new
  end

  # POST /contact_forms
  # POST /contact_forms.json
  def create
    email = params["contact"]["email"]
    message = params["contact"]["message"]

    if !message.blank? and !email.blank?
      sendgrid = SendGrid::Client.new(api_user: 'ggallais', api_key: '31get_gui')
      email = SendGrid::Mail.new do |m|
        m.to      = 'contact@getup.fr'
        m.from    = 'contact@getup.fr'
        m.subject = "[GETUP] Nouveau message de la part de #{email}"
        m.html    = "Email : #{email}<br/><br/>Message : <br/>#{message}"
      end

      sendgrid.send(email)

      flash[:notice] = 'Merci de nous avoir contacté. Votre message sera traité dans les meilleurs délais.'
    end


    
    redirect_to front_root_path

  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_form_params
      params.require(:contact_form).permit(:firstname, :lastname, :email, :message, :organisation_id, :captcha_answer)
    end
end
