class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def gitbook
    render json: { test: env['omniauth.auth'] }
  end

  def github
    render json: { test: env['omniauth.auth'] }
  end
end