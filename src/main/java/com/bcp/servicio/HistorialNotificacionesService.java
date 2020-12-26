package com.bcp.servicio;

import java.util.List;
import java.util.Optional;



import com.bcp.entidad.HistorialNotificaciones;


public interface HistorialNotificacionesService {
	
	public abstract HistorialNotificaciones  registraHistorial(HistorialNotificaciones obj);
	
	public abstract List<HistorialNotificaciones>  listaPorCliente(int idCliente);
	
	public abstract Optional<HistorialNotificaciones> buscarPorId(int id);
	
	public abstract void eliminaHistorialNotificaciones(int id);
	
    public abstract List<HistorialNotificaciones> listaPorCliente2(int idCliente);
}
