# -*- coding: utf-8 -*-

class Back::SousactivitesController < BackController
  include Tools

  before_action :set_sousactivite, only: [:show, :edit, :update, :destroy, :publish_status, :previsu]

  def show
  end

  def new
    @sousactivite = Sousactivite.new
    @sousactivite.activite_id = params[:activite_id]
  end

  def edit
    @sousactivite.sousactivite_images.new()
  end

  def previsu
  end

  def create
    @sousactivite = Sousactivite.new(sousactivite_params)

    respond_to do |format|
      if @sousactivite.save
        format.html { redirect_to back_activites_path(get_params), notice: "Opération réussie" }
        format.json { render :show, status: :created, location: @sousactivite }
      else
        puts ("Unable to create sousactivite => #{@sousactivite}, #{@sousactivite.errors.full_messages}")
        format.html { render :new }
        format.json { render json: @sousactivite.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      # Then, delete images that are deleted
      @sousactivite.sousactivite_images.each do |sousactivite_image|
        if params['list_images']
          unless params['list_images'].include? sousactivite_image.id.to_s
            puts "destroy #{sousactivite_image.id}"
            sousactivite_image.destroy
          end
        end
      end
      if @sousactivite.update(sousactivite_params)
        format.html { redirect_to back_activites_path(get_params), notice: "Opération réussie" }
        format.json { render :show, status: :ok, location: @sousactivite }
      else
        puts ("Unable to update sousactivite => #{@sousactivite}, #{@sousactivite.errors.full_messages}")
        format.html { render :edit }
        format.json { render json: @sousactivite.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @sousactivite.destroy
      respond_to do |format|
        format.html { redirect_to back_activites_path(get_params), notice: "Opération réussie" }
        format.json { head :no_content }
      end
    else
      puts ("Unable to destroy sousactivite => #{@sousactivite}, #{@sousactivite.errors.full_messages}")
      redirect_to back_activites_path(get_params), alert: "Echec de l'opération"
    end
  end

  def publish_status
    if @sousactivite.publishing(params[:publish].to_boolean)
      redirect_to back_activites_path(get_params), notice: "Opération réussie"
    else
      puts ("Unable to publish_status sousactivite => #{@sousactivite}, #{@sousactivite.errors.full_messages}")
      redirect_to back_activites_path(get_params), alert: "Echec de l'opération"
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sousactivite
    @sousactivite = Sousactivite.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sousactivite_params
    params.require(:sousactivite).permit!
  end

  def get_params
    params.slice(:scope_published, :scope_activite_id, :scope_text)
  end

end
