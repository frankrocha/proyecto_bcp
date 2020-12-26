package com.bcp.servicio;

import java.util.List;
import com.bcp.entidad.Cuenta;


public interface CuentaService {

	public abstract List<Cuenta>  listaCuentaPorCliente(int idCliente);
	public abstract Cuenta listaCuentaPorNumero(String numero);
	public abstract Cuenta listaCuentaPorNumero2(String numero);
	
	public abstract Cuenta listaCuentaPorIdCuenta(int id);
	
}
