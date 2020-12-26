package com.bcp.servicio;



import java.util.List;

import com.bcp.entidad.ConfiguracionNotificacion;

public interface ConfiguracionnotificacionsService  {

	public abstract List<ConfiguracionNotificacion> listarConfiguracioPorTipoTarjeta(String numero);
	
	public abstract List<ConfiguracionNotificacion> listarConfiguracion();
	
	
}
