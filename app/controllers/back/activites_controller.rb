# -*- coding: utf-8 -*-

class Back::ActivitesController < BackController
  include Tools

  before_action :set_activite, only: [:show, :edit, :update, :destroy, :publish_status, :previsu]

  def index
    @activites = Activite.order("activites.title ASC").filter(get_params).page(params[:page]).per(5)
    session[:tabs] = ""
  end

  def show
  end

  def new
    @activite = Activite.new
  end

  def edit
  end

  def previsu
  end

  def create
    @activite = Activite.new(activite_params)

    respond_to do |format|
      if @activite.save
        format.html { redirect_to back_activites_path(@activite.id), notice: "Opération réussie" }
        format.json { render :show, status: :created, location: @activite }
      else
        puts ("Unable to create activite => #{@activite}, #{@activite.errors.full_messages}")
        format.html { render :new }
        format.json { render json: @activite.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @activite.update(activite_params)
        format.html { redirect_to back_activites_path(get_params), notice: "Opération réussie" }
        format.json { render :show, status: :ok, location: @activite }
      else
        puts ("Unable to update activite => #{@activite}, #{@activite.errors.full_messages}")
        format.html { render :edit }
        format.json { render json: @activite.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @activite.destroy
      respond_to do |format|
        format.html { redirect_to back_activites_path(get_params), notice: "Opération réussie" }
        format.json { head :no_content }
      end
    else
      puts ("Unable to destroy activite => #{@activite}, #{@activite.errors.full_messages}")
      redirect_to back_activites_path(get_params), alert: "Echec de l'opération"
    end
  end

  def publish_status
    if @activite.publishing(params[:publish].to_boolean)
      redirect_to back_activites_path(get_params), notice: "Opération réussie"
    else
      puts ("Unable to publish_status activite => #{@activite}, #{@activite.errors.full_messages}")
      redirect_to back_activites_path(get_params), alert: "Echec de l'opération"
    end
  end

  def update_all
    update_list_object(Activite, back_activites_path(get_params))
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_activite
    @activite = Activite.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def activite_params
    params.require(:activite).permit!
  end

  def get_params
    params.slice(:scope_published, :scope_activite_id, :scope_text)
  end

end
