class ArticuloController < ApplicationController
  def new
  	@articulo = Articulo.new
  	@articulo.integrante = Integrante.new
  	#@articulo.integrante.comentario = Comentario.new

  	@articulo.comentarios << Comentario.new(integrante: @articulo.integrante)


  end

  def create
  	@articulo = Articulo.new(tema: params[:articulo_tema],titulo: params[:articulo_titulo],descripcion: params[:articulo_descripcion],archivo: params[:articulo_archivo],tipo: params[:articulo_tipo],url: params[:articulo_url])
  end
end
