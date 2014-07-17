class InstitucionEducativaController < ApplicationController
  def new
  	@institucion_educativa = Institucion_educativa.new
    @institucion_educativa.contacto = Contacto.new 
    @institucion_educativa.contacto.direccion = Direccion.new

    @representante = Representante.new
    @representante.contacto = Contacto.new
    @persona = @representante.contacto.contactable = Persona.new
  end

  def create
  	@institucion_educativa = Institucion_educativa.new(nombre: params[:institucion_educativa_nombre], status: params[:Institucion_educativa_estatus])
    @institucion_educativa.contacto = Contacto.new(tel: params[:contacto_tel],email: params[:contacto_email],pag_web: params[:contacto_pag_web])
    @institucion_educativa.contacto.direccion = Direccion.new(calle: params[:direccion_calle],colonia: params[:direccion_colonia],cp: params[:direccion_cp], municipio_id: params[:direccion_municipio])

    @representante = Representante.new(puesto: params[:representante_puesto])
    @representante.contacto = Contacto.new(tel: params[:contacto_tel],email: params[:contacto_email])
    @persona = @representante.contacto.contactable = Persona.new(nombre: params[:representante_nombre])

  end

  