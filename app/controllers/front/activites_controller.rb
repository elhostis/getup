class Front::ActivitesController < FrontController

  def show
    @activite = Activite.friendly.find(params[:id])
    raise ActiveRecord::RecordNotFound unless @activite.publish

    if params[:sousactivite]
      begin
        @sousactivite = Sousactivite.friendly.find(params[:sousactivite])
        if @sousactivite.activite != @activite
          @sousactivite = @activite.sousactivites.first
        end
      rescue
        # Do nothing
        @sousactivite = @activite.sousactivites.first
      end
    else
      @sousactivite = @activite.sousactivites.first
    end
  rescue ActiveRecord::RecordNotFound
    render_404
  end

end
