module SessionsHelper
   def sign_in(user)
      remember_token = User.new_remember_token
      cookies.permanent[:remember_token] = remember_token
      user.update_attribute(:remember_token, User.hash(remember_token))
      self.current_user = user
    end # end of method sign_in( user )
    
    def signed_in?
      !current_user.nil?
    end
    
    def current_user=(user)
      @current_user = user
    end
    
    def current user
      rememeber_token = User.hash(cookies[:remember_token])
      @current_user ||= User.find_by(remember_token: remember_token)
    end

end # end of module SessionHelper
