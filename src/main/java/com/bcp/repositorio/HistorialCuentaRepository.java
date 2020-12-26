package com.bcp.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.bcp.entidad.HistorialCuenta;

public interface HistorialCuentaRepository  extends JpaRepository<HistorialCuenta, Integer>{

	@Query("select p from HistorialCuenta p where p.cuenta.idCuenta = :param ORDER BY p.fechaRegistro DESC")
	public abstract List<HistorialCuenta>  listaHistorialCuenta(@Param("param") int idCuenta);
	
	
}
