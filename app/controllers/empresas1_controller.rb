class Empresas1Controller < ApplicationController
  def new
  	@empresa.representante = Representante.new
  	@empresa.representante.persona = Persona.new
  end

  def create
  	@empresa.representante = Persona.new(params_persona)

  	#Guardamos! :)
  	@investigador.save
  end

  protected

  def params_investigador
  	#Esto hace que de los parámetros que se reciban, unicamente aceptaremos los indicados.
  	params.require(:investigador).permit(:promep, :sni, :tc, persona_attributes: [:nombre, :apellido_pat, :apellido_mat, contacto_attributes: [:tel, :email, direccion_attributes: [:calle] ]] )
  end
end
