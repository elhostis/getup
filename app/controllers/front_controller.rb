# encoding: utf-8

class FrontController < ApplicationController
  layout 'front'

  before_filter :load_menus

  def plandusite
    @activites = Activite.scope_published(true).order("activites.title ASC")
  end

  def references
  end

  private

  def load_menus
    @top_menu = Activite.scope_published(true).order("activites.title ASC")
  end

end
