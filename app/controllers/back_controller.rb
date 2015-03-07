# encoding: utf-8

class BackController < ApplicationController
  layout 'back'

  before_filter :authenticate_user!

end
