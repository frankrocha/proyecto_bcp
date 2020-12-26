package com.bcp.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bcp.entidad.ConfiguracionNotificacion;

import com.bcp.repositorio.ConfiguracionnotificacionsRepository;


@Service
public class ConfiguracionnotificacionsServiceImpl  implements ConfiguracionnotificacionsService{

	@Autowired
	private ConfiguracionnotificacionsRepository repository;
	
	@Override
	public List<ConfiguracionNotificacion> listarConfiguracioPorTipoTarjeta(String numero) {
	
		return repository.listarConfiguracioPorTipoTarjeta(numero);
	}

	@Override
	public List<ConfiguracionNotificacion> listarConfiguracion() {

		return repository.findAll();
	}
	
	

}
