class DireccionesController < ApplicationController
  def get_estados
  	estados = Estado.where(pais_id: params[:pais_id].to_i).order(:nombre).all.map{|estado| {id: estado.id, nombre: estado.nombre} }
  	respond_to do |format|
  		format.any{ render json: estados }
  	end
  end

  def get_municipios
  	municipios = Municipio.where(estado_id: params[:estado_id].to_i).order(:nombre).all.map{|municipio| {id: municipio.id, nombre: municipio.nombre} }
  	respond_to do |format|
  		format.any{ render json: municipios }
  	end
  end
end
