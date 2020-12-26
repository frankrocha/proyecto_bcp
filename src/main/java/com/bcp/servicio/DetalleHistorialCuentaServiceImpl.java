package com.bcp.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bcp.entidad.DetalleHistorialCuenta;
import com.bcp.repositorio.DetalleHistorialCuentaRepository;


@Service
public class DetalleHistorialCuentaServiceImpl implements DetalleHistorialCuentaService {
 
	@Autowired
	private DetalleHistorialCuentaRepository  detalleHistorialCuentaRepository;
	
	@Override
	public DetalleHistorialCuenta obtenerDetalleHistorial(int idHistorialCuenta) {
	
		return detalleHistorialCuentaRepository.obtenerDetalleHistorial(idHistorialCuenta);
	}

	@Override
	public DetalleHistorialCuenta registraDetalleHistorial(DetalleHistorialCuenta obj) {
		return detalleHistorialCuentaRepository.save(obj);
	}

	
	
}
