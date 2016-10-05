class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def gitbook
    auth_info = request.env['omniauth.auth'].info
    user = User.find_or_create_by_uid(request.env['omniauth.auth'].uid)

    # Update user data
    user.update_columns!({
      username: auth_info.username,
      name: auth_info.name,
      avatar_url: auth_info.urls.avatar,
      stars_url: auth_info.urls.stars,
      auth_token: auth_info.auth.token,
      token: auth_info.token,
    })

    sign_in_and_redirect user, event: :authentication
  end
end