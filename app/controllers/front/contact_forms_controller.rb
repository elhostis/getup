class Front::ContactFormsController < FrontController
  def new
  end

  def create
    message = params["contact"]["message"]

    if !message.blank?
      GetupMailer.contact_email(params["contact"]).deliver
      flash[:notice] = 'Merci de nous avoir contacté. Votre message sera traité dans les meilleurs délais.'
    else
      flash[:alert] = 'Votre message est vide, opération impossible'
    end
    
    redirect_to front_root_path

  end

end
