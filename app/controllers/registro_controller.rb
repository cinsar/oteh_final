class RegistroController < ApplicationController
  def index
  	if request.post?
  		#Entró por formaulrio osea eligió una opción

  		if params[:tipo_registro] == 'empresa'
  			redirect_to(action: :empresa) and return
  		end

  		if params[:tipo_registro] == 'externo'
  			redirect_to(action: :externos) and return
  		end


  	else
  		#Entro por URL, osea es la primera vez que entra
  	end


  end


  def empresa
    @empresa = Empresa.new
    @empresa.contacto = Contacto.new 
    @empresa.contacto.direccion = Direccion.new

    @representante = Representante.new
    @representante.contacto = Contacto.new
    @persona = @representante.contacto.contactable = Persona.new
  end

  def externos

  end


  def create_empresa
    
  end

end
