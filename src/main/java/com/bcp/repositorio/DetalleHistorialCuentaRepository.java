package com.bcp.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.bcp.entidad.DetalleHistorialCuenta;

public interface DetalleHistorialCuentaRepository extends JpaRepository<DetalleHistorialCuenta, Integer> {

	
	@Query("select p from DetalleHistorialCuenta p where p.historialCuenta.idHistorialCuenta = :param")
	public abstract DetalleHistorialCuenta obtenerDetalleHistorial(@Param("param") int idHistorialCuenta);
	
	
}
