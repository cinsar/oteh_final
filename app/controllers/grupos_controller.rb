class GruposController < ApplicationController
  def new
  	@grupo = Grupo.new
  	@grupo.integrantes = [Integrante.new]
    #@grupo.integrantes << Integrante.new
  end
  def create
  	@grupo = Grupo.new(tipo: params[:grupo_tipo],nombre: params[:grupo_nombre],objetivo:[:grupo_objetivo],privado:[:grupo_privado])

  	@centro_investigacion = CentroInvestigacion.new(contacto: Contacto.new(direccion: Direccion.new))
  end
  		
end