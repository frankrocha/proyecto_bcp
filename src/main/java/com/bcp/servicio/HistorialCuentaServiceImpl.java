package com.bcp.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bcp.entidad.HistorialCuenta;
import com.bcp.repositorio.HistorialCuentaRepository;

@Service
public class HistorialCuentaServiceImpl implements HistorialCuentaService{

	@Autowired
	private HistorialCuentaRepository repository;

	@Override
	public HistorialCuenta registraHistorial(HistorialCuenta obj) {
		return repository.save(obj);
	}

	@Override
	public List<HistorialCuenta> listaHistorialCuenta(int idCuenta) {
	
		return repository.listaHistorialCuenta(idCuenta);
	}
	
	

}
