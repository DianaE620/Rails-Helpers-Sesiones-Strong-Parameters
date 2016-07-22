class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :false_login
  #skip_before_action :false_login, only: [:index, :create]
  #Tambien puedes usar except

  #flash is a special part of the session
  def false_login

    pass = false

    if pass
      flash.now[:error] = "Se supone que te logueaste"
      session[:nombre] = "Dianita"
    else
      flash[:error] = "Se supone que no te logueaste"
      reset_session
    end

  end


  def metodo1
    "Soy metodo1"
  end

  helper_method :metodo1


end
