# -*- coding: utf-8 -*-

class Back::SousactiviteImagesController < BackController

  before_action :load_sousactivite, except: [:update_row_order]
  before_action :load_sousactivite_image, only: [:edit, :update, :destroy, :update_row_order]

  def new
    @sousactivite_image = @sousactivite.sousactivite_images.build
  end

  def create
    @sousactivite_image = SousactiviteImage.new(sousactivite_image_params)

    # To keep the mails tabs
    session[:tabs] = "#image"

    respond_to do |format|
      if @sousactivite_image.save
        format.html { redirect_to edit_back_sousactivite_path(@sousactivite.id), notice: "Mise à jour effectuée" }
      else
        format.html { redirect_to edit_back_sousactivite_path(@sousactivite.id), alert: "Echec ! <br/>#{@sousactivite_image.errors.full_messages.join(',')}" }
      end
    end
  end

  def edit
  end

  def update
    # To keep the mails tabs
    session[:tabs] = "#image"

    respond_to do |format|
      if @sousactivite_image.update_attributes(sousactivite_image_params)
        format.html { redirect_to edit_back_sousactivite_path(@sousactivite.id), notice: "Mise à jour effectuée" }
      else
        format.html { redirect_to edit_back_sousactivite_path(@sousactivite.id), alert: "Echec ! <br/>#{@sousactivite_image.errors.full_messages.join(',')}" }
      end
    end
  end

  def destroy
    session[:tabs] = "#image"
    @sousactivite_image.destroy
    redirect_to edit_back_sousactivite_path(@sousactivite.id), notice: "Mise à jour effectuée"
  end

  def update_row_order
    @sousactivite_image.update_attribute :row_order_position, params[:row_order_position]
    @sousactivite_image.save!

    render nothing: true
  end

  private

  def load_sousactivite
    @sousactivite = Sousactivite.find(params[:sousactivite_id])
  end

  def load_sousactivite_image
    @sousactivite_image = SousactiviteImage.find(params[:id])
  end

  def sousactivite_image_params
    params.require(:sousactivite_image).permit!
  end

end
