class RegistroController < ApplicationController
  def index
  	if request.post?
  		#Entró por formaulrio osea eligió una opción

      @user = User.create(email: params[:user_email], password: params[:user_password], password_confirmation: params[:user_password_confirmation])
      
      session[:user_registered_id] = @user.id
      
      case params[:tipo_registro]
        when 'centro_investigacion'
          redirect_to(action: :centro_investigacion) and return
        when 'institucion_educativa'
          redirect_to(action: :institucion_educativa) and return
        when 'empresa'
          redirect_to(action: :empresa) and return
        when 'investigador'
          redirect_to(action: :investigador) and return
        when 'estudiante'
          redirect_to(action: :estudiante) and return
        when 'externo'
          redirect_to(action: :externo) and return
      end      
  	else
  		#Entro por URL, osea es la primera vez que entra
  	end
  end

  def centro_investigacion
    @user_id = session[:user_registered_id]
    session[:user_new_id] = nil

    @centro_investigacion = CentroInvestigacion.new(contacto: Contacto.new(direccion: Direccion.new))

    @representante = Representante.new(contacto: Contacto.new(contactable: Persona.new))
    @persona = @representante.contacto.contactable
  end

  def institucion_educativa
    @user_id = session[:user_registered_id]
    session[:user_new_id] = nil

    @institucion_educativa = InstitucionEducativa.new(contacto: Contacto.new(direccion: Direccion.new))

    @representante = Representante.new
    @representante.contacto = Contacto.new
    @persona = @representante.contacto.contactable = Persona.new
  end

  def empresa
    @user_id = session[:user_registered_id]
    session[:user_new_id] = nil

    @empresa = Empresa.new(contacto: Contacto.new(direccion: Direccion.new))

    @representante = Representante.new(contacto: Contacto.new(contactable: Persona.new))
    @persona = @representante.contacto.contactable
  end

  def investigador
    @user_id = session[:user_registered_id]
    session[:user_new_id] = nil

    @persona = Persona.new(contacto: Contacto.new(direccion: Direccion.new))
    @investigador = Investigador.new(centro_investigacion: CentroInvestigacion.new)
  end

  def estudiante
    @user_id = session[:user_registered_id]
    session[:user_new_id] = nil

    @persona = Persona.new
    @persona.contacto = Contacto.new 
    @persona.contacto.direccion = Direccion.new

    @estudiante = Estudiante.new
    @institucion_educativa = @estudiante.institucion_educativa = InstitucionEducativa.new
  end

  def externo
    @user_id = session[:user_registered_id]
    session[:user_new_id] = nil
    
    @externo = Externo.new(persona: @persona = Persona.new)
    @persona.contacto = Contacto.new 
    @persona.contacto.direccion = Direccion.new

  end

#create

  def create_centro_investigacion
    @centro_investigacion = CentroInvestigacion.new(nombre: params[:centro_investigacion_nombre])
    @centro_investigacion.contacto = Contacto.new(tel: params[:representante_tel],email: params[:representante_email])
    @centro_investigacion.contacto.direccion = Direccion.new(calle: params[:direccion_calle], colonia: params[:direccion_colonia], cp: params[:direccion_cp], municipio_id: params[:direccion_municipio])

    @representante = Representante.new(puesto: params[:representante_puesto])
    @representante.contacto = Contacto.new(tel: params[:representante_tel],email: params[:representante_email])
    @persona = @representante.contacto.contactable = Persona.new(nombre: params[:representante_nombre])

    @guardado = false

    ActiveRecord::Base.transaction do      

      @user = User.where(id: params[:user_id]).first
      @user.authenticable = @persona if @user

      @guardado = (@centro_investigacion.save and @representante.save and @user.save)
      raise ActiveRecord::Rollback if !@guardado
    end

    if @guardado
    else
      render action: :centro_investigacion
    end

  end

  def create_institucion_educativa
    @institucion_educativa = InstitucionEducativa.new(nombre: params[:institucion_educativa_nombre])
    @institucion_educativa.contacto = Contacto.new(tel: params[:institucion_educativa_tel],email: params[:institucion_educativa_email])
    @institucion_educativa.contacto.direccion = Direccion.new(calle: params[:direccion_calle],colonia: params[:direccion_colonia],cp: params[:direccion_cp], municipio_id: params[:direccion_municipio])
    
    @representante = Representante.new(puesto: params[:representante_puesto])
    @representante.contacto = Contacto.new(tel: params[:contacto_tel],email: params[:contacto_email])
    @persona = @representante.contacto.contactable = Persona.new(nombre: params[:representante_nombre], apellido_pat: params[:representante_apellido_pat], apellido_mat: params[:representante_apellido_mat])
    

    @guardado = false

    ActiveRecord::Base.transaction do
      @institucion_educativa.save and @representante.save and @persona and @guardado = true
    end

    if @guardado
    else
      render action: :institucion_educativa
    end
  end  

  def create_empresa
    @empresa = Empresa.new(nombre: params[:empresa_nombre],giro: params[:empresa_giro],no_empleados:params[:empresa_no_empleados],persona_fiscal:params[:empresa_persona_fiscal])
    @empresa.contacto = Contacto.new(tel: params[:contacto_tel],email: params[:contacto_email],pag_web: params[:contacto_pag_web])
    @empresa.contacto.direccion = Direccion.new(calle: params[:direccion_calle],colonia: params[:direccion_colonia],cp: params[:direccion_cp], municipio_id: params[:direccion_municipio])

    @representante = Representante.new(puesto: params[:representante_puesto])
    @representante.contacto = Contacto.new(tel: params[:representante_tel],email: params[:representante_email])
    @persona = @representante.contacto.contactable = Persona.new(nombre: params[:representante_nombre])

    @representante.representable = @empresa

    ActiveRecord::Base.transaction do
      @guardado = (@empresa.save and @representante.save  and @persona.save)
      raise ActiveRecord::Rollback if !@guardado
    end

    if @guardado
    else
      render action: :empresa
    end
  end

  def create_investigador
    @persona = Persona.new(nombre: params[:persona_nombre], apellido_pat: params[:persona_apellido_pat], apellido_mat: params[:persona_apellido_mat])
    @persona.contacto = Contacto.new(tel: params[:persona_tel], email: params[:persona_email])
    @persona.contacto.direccion = Direccion.new(calle: params[:direccion_calle], colonia: params[:direccion_colonia], cp: params[:direccion_cp], municipio_id: params[:direccion_municipio])

    @investigador = Investigador.new(promep: params[:investigador_promep], sni: params[:investigador_sni], tc: params[:investigador_tc])
    @investigador.centro_investigacion = CentroInvestigacion.new(nombre: params[:centro_investigacion_nombre])
    
    @guardado = false

    ActiveRecord::Base.transaction do
      @guardado = (@persona.save and @investigador.save)
      raise ActiveRecord::Rollback if !@guardado
    end

    if @guardado
    else
      render action: :persona
    end
  end

  def create_estudiante
    @persona = Persona.new(nombre: params[:persona_nombre], apellido_pat: params[:persona_apellido_pat], apellido_mat: params[:persona_apellido_mat])
    @persona.contacto = Contacto.new(tel: params[:contacto_tel], email: params[:contacto_email])
    @persona.contacto.direccion = Direccion.new(calle: params[:direccion_calle], colonia: params[:direccion_colonia], cp: params[:direccion_cp], municipio_id: params[:direccion_municipio])

    @estudiante = Estudiante.new(persona: @persona)

    @institucion_educativa = @estudiante.institucion_educativa = InstitucionEducativa.new(nombre: params[:institucion_educativa_nombre])

    @guardado = false

    ActiveRecord::Base.transaction do
      @guardado = (@persona.save and @estudiante.save and @institucion_educativa.save)
      raise ActiveRecord::Rollback if !@guardado
    end

    if @guardado
    else
      render action: :estudiante
    end
  end

  def create_externo
    @persona = Persona.new(nombre: params[:persona_nombre], apellido_pat: params[:persona_apellido_pat], apellido_mat: params[:persona_apellido_mat])
    @persona.contacto = Contacto.new(tel: params[:contacto_tel], email: params[:contacto_email])
    @persona.contacto.direccion = Direccion.new(calle: params[:direccion_calle], colonia: params[:direccion_colonia], cp: params[:direccion_cp], municipio_id: params[:direccion_municipio])

    @guardado = false

    @externo = Externo.new(persona: @persona)

    ActiveRecord::Base.transaction do
      @externo.save and @persona.save and @guardado = true
    end

    if @guardado
    else
      render action: :externo
    end
  end

end
