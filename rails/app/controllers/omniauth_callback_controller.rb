class OmniauthCallbackController < Devise::OmniauthCallbacksController
  def twitter
    raise env["omniauth.auth"].inspect
    @user = User.find_or_create_for_twitter(env["omniauth.auth"])
  end
end
