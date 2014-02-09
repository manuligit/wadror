class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # määritellään, että metodi current_user tulee käyttöön myös näkymissä
  helper_method :current_user

  #helper_method :admin_user

  def current_user
    return nil if session[:user_id].nil?
      ##tarkistetaan, onko käyttäjää olemassa:
      if User.exists?(session[:user_id])
        User.find(session[:user_id])
      else
        return nil
      end
  end

  #def admin_user
  #  return nil if session[:user_id].nil?
  #  ##tarkistetaan, onko käyttäjää olemassa:
  #  if User.exists?(session[:user_id])
  #    if User.is admin
  #      return true
  #  else
  #    return nil
  #  end
  #end

  def ensure_that_signed_in
    redirect_to signin_path, notice:'you should be signed in' if current_user.nil?
  end
end
