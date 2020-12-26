package com.bcp.servicio;


import com.bcp.entidad.DetalleHistorialCuenta;

public interface DetalleHistorialCuentaService {

	
	public abstract DetalleHistorialCuenta obtenerDetalleHistorial(int idHistorialCuenta);
	
	public abstract DetalleHistorialCuenta registraDetalleHistorial(DetalleHistorialCuenta obj);
}
