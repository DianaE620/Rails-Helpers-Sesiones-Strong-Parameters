=begin

En Rails existe una separación por lo que los helpers solamente los podrás utilizar en tus vistas. 

Para los controladores podrás crear métodos dentro de AplicationController

----- Dos maneras diferentes para compartir métodos entre vistas y controladores

http://stackoverflow.com/questions/3992659/in-rails-what-exactly-do-helper-and-helper-method-do

#application_controller.rb
def current_user
  @current_user ||= User.find_by_id!(session[:user_id])
end
helper_method :current_user
the helper method on the other hand, is for importing an entire helper to the views provided by the controller (and it's inherited controllers). What this means is doing

# application.rb
config.action_controller.include_all_helpers = true
# This is the default anyway, but worth knowing how to turn it off

# home_controller.rb
helper UserHelper

# HomeHelper
include UserHelper

------ Filters en Rails

http://guides.rubyonrails.org/action_controller_overview.html#filters

------ Filters en Rails

http://guides.rubyonrails.org/action_controller_overview.html

=end

#Comandos Rails documentacion
http://guides.rubyonrails.org/command_line.html 

# ....................Notas Helpers

#module ApplicationHelper
#Helpers para todas las vista en distinto controladores

#module UsersHelper
#Helpers para todas las vista del controlador de usuarios

#ApplicationController
#Helpers para todos los controladores

#UsersController
#Puedes crear metodos para el user controller helper incluidos

#Me permité utilizar un metodo de controlador en una vista
#helper_method :nombre del metodo
#helper_method :metodo1

#En sinatra al final de los controladores siempre hacíamos una 
#de dos cosas Render o Redirect. En rails puedes omitir el 
#render y por convención Rails hará render de una vista con 
#el mismo nombre de la acción que se encuentre en una carpeta 
#con el nombre del controlador.

class PostsController < ApplicationController

  def index
    # Por default se hará render de `app/views/posts/index.rb`
  end

#http://guides.rubyonrails.org/action_controller_overview.html#filters

# ....................Notas Filtros

#Tambien podemos utilizar filtros para limitar el acceso a ciertas paginas
before_action :false_login
skip_before_action :false_login, only: [:index, :create]
#Tambien puedes usar except


# ....................Notas Filtros

#Inicias la sesion guardando datos en sesion
session[:nombre] = "Jesus"
# Rails tiene mensajes que pertenecen a las sesiones 
#y es una forma sencilla de mandar un error a la vista
flash[:error] = "Contraseña incorrecta"
#Tambien podemos usar cookies
cookies[:commenter_name] = @comment.author
#Para terminar la sesion uilizamos reset_session
reset_session


# ....................Strong Parameters

# Permiten que los datos ingresados a la base de datos esten
# cuidados dentro de un metodo y bajo una especificacion de condiciones
# permitnedo una plicacion mas segura

# https://www.youtube.com/watch?v=XV5rRoI0v2k

class PeopleController < ActionController::Base
  # This will raise an ActiveModel::ForbiddenAttributes exception
  # because it's using mass assignment without an explicit permit
  # step.
  def create
    Person.create(params[:person])
  end
 
  # This will pass with flying colors as long as there's a person key
  # in the parameters, otherwise it'll raise a
  # ActionController::ParameterMissing exception, which will get
  # caught by ActionController::Base and turned into that 400 Bad
  # Request reply.
  def update
    person = current_account.people.find(params[:id])
    person.update!(person_params)
    redirect_to person
  end
 
  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def person_params
      params.require(:person).permit(:name, :age)
    end
end




