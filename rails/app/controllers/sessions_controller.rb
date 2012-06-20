class SessionsController < ApplicationController
  def callback
    auth = request.env["omniauth.auth"]
    user = User.find_from_oauth( auth["provider"], auth["uid"] )
    unless user then
      user = User.create_with_omniauth( auth )
    end
    session[:user_id] = user.id
    redirect_to :root, notice: :login_complete
  end

  def logout
    session[:user_id] = nil
    redirect_to :root
  end
end
