class SessionsController < Devise::SessionsController

  # Call when a user is trying to connect to the application
  #
  def create
    super
  end

end
