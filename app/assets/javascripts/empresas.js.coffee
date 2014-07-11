$(document).ready(->
	if $('#direccion_pais').size() > 0
		$('#direccion_pais').on('change', ->
			$.get('/direcciones/get_estados.json', {pais_id: $(this).val() }, (data)->
				if $('#direccion_estado').size() > 0
					$('#direccion_estado').empty()
					$('#direccion_municipio').empty()
					$('#direccion_estado').append("<option>Elige un estado</option>")

					for element in data
						$('#direccion_estado').append("<option value='#{element.id}'>#{element.nombre}</option>")
			)
		)

	if $('#direccion_estado').size() > 0
		$('#direccion_estado').on('change', ->
			$.get('/direcciones/get_municipios.json', { estado_id: $(this).val() }, (data)->
				if $('#direccion_municipio').size() > 0
					$('#direccion_municipio').empty()
					$('#direccion_municipio').append("<option>Elige un municipio</option>")

					for element in data
						$('#direccion_municipio').append("<option value='#{element.id}'>#{element.nombre}</option>")
			)
		)
)