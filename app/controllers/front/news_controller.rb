class Front::NewsController < FrontController

  def index
    @news = New.order("news.created_at DESC")
  end

end
