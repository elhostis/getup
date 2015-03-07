# -*- coding: utf-8 -*-


class ApplicationController < ActionController::Base
  layout 'front'

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def render_404
    respond_to do |format|
      format.html {
        render :file => "#{Rails.root}/public/404.html",
        :status => :not_found, :layout => false
      }
      format.any { head :not_found }
    end
  end

  def render_500
    respond_to do |format|
      format.html {
        render :file => "#{Rails.root}/public/500.html",
        :status => :internal_server_error, :layout => false
      }
      format.any { head :not_found }
    end
  end

end

