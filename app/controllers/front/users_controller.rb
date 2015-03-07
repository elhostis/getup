# -*- coding: utf-8 -*-

class Front::UsersController < FrontController

  before_action :authenticate_user!, except: [:show]

  def show
    @user = (params[:id] ? User.find(params[:id]) : current_user)

    respond_to do |format|
      format.html
      format.json { render json: @user.to_json.gsub("%undefined%", "#{session[:secret]}") }
    end
  end

end
