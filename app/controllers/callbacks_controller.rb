class CallbacksController < Devise::OmniauthCallbacksController
  def twitter
    auth = request.env["omniauth.auth"]
    @user = User.find_by_twitter(auth)
    sign_in_and_redirect @user

    # @user = User.from_omniauth(request.env["omniauth.auth"])
    # if @user.nil?
    #   @user = User.create(
    #     provider: auth['provider'],
    #     uid: auth['uid'],
    #     name: auth['info']['name']
    #   )
    # end
    # sign_in_and_redirect @user  # This line will sign the user in.
  end
end
