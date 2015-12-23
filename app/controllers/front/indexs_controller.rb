class Front::IndexsController < FrontController

  before_action only: [:index]

  def index

    @news = New.scope_published(true).order("news.created_at DESC").page(1).per(5)
    @activite = Activite.scope_published(true).order("title")
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
end
