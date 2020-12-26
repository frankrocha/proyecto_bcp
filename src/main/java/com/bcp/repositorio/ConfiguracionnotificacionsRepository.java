package com.bcp.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.bcp.entidad.ConfiguracionNotificacion;

public interface ConfiguracionnotificacionsRepository  extends JpaRepository<ConfiguracionNotificacion, Integer>{
	
	
	@Query("Select x from ConfiguracionNotificacion x where x.tarjeta.idTarjeta= :num")
	public abstract List<ConfiguracionNotificacion> listarConfiguracioPorTipoTarjeta(@Param(value = "num") String numero );
	
	

	
	
}
