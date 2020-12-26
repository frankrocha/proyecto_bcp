package com.bcp.servicio;

import java.util.List;


import com.bcp.entidad.HistorialCuenta;


public interface HistorialCuentaService {

	public abstract HistorialCuenta  registraHistorial(HistorialCuenta obj);
	
	
	public abstract List<HistorialCuenta>  listaHistorialCuenta(int idCuenta);
	
}
