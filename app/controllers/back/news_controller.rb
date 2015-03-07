# -*- coding: utf-8 -*-

class Back::NewsController < BackController
  include Tools

  before_action :set_new, only: [:show, :edit, :update, :destroy, :publish_status, :previsu]

  def index
    @news = New.order("news.created_at DESC").filter(get_params).page(params[:page]).per(5)
  end

  def show
  end

  def new
    @new = New.new
  end

  def edit
  end

  def previsu
  end

  def create
    @new = New.new(new_params)

    respond_to do |format|
      if @new.save
        format.html { redirect_to back_news_index_path(@new.id), notice: "Opération réussie" }
        format.json { render :show, status: :created, location: @new }
      else
        puts ("Unable to create new => #{@new}, #{@new.errors.full_messages}")
        format.html { render :new }
        format.json { render json: @new.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @new.update(new_params)
        format.html { redirect_to back_news_index_path(get_params), notice: "Opération réussie" }
        format.json { render :show, status: :ok, location: @new }
      else
        puts ("Unable to update new => #{@new}, #{@new.errors.full_messages}")
        format.html { render :edit }
        format.json { render json: @new.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @new.destroy
      respond_to do |format|
        format.html { redirect_to back_news_index_path(get_params), notice: "Opération réussie" }
        format.json { head :no_content }
      end
    else
      puts ("Unable to destroy new => #{@new}, #{@new.errors.full_messages}")
      redirect_to back_news_index_path(get_params), alert: "Echec de l'opération"
    end
  end

  def publish_status
    if @new.publishing(params[:publish].to_boolean)
      redirect_to back_news_index_path(get_params), notice: "Opération réussie"
    else
      puts ("Unable to publish_status new => #{@new}, #{@new.errors.full_messages}")
      redirect_to back_news_index_path(get_params), alert: "Echec de l'opération"
    end
  end

  def update_all
    update_list_object(New, back_news_index_path(get_params))
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_new
    @new = New.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def new_params
    params.require(:new).permit!
  end

  def get_params
    params.slice(:scope_published, :scope_new_id, :scope_text)
  end

end
