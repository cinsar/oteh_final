class EmpresasController < ApplicationController
  def new
  	@empresa = Empresa.new
  	@empresa.contacto = Contacto.new
  	@empresa.contacto.direccion = Direccion.new

    respond_to do |format|
      format.html{}
    end

  end

  def create
  	@empresa = Empresa.new(nombre:params[:empresa_nombre],giro:params[:empresa_giro],no_empleados:params[:no_empleados],persona_fiscal:params[:persona_fiscal])
  	@empresa.contacto = Contacto.new(tel: params[:contacto_tel],email: params[:contacto_email],pag_web: params[:contacto_pag_web])
  	@empresa.contacto.direccion = Direccion.new(calle: params[:direccion_calle],colonia: params[:direccion_colonia],cp: params[:direccion_cp])
  
    @guardado = false
    if @empresa.contacto.direccion.save
    	@guardado = @empresa.save if @empresa.contacto.save
    end
  end
end
