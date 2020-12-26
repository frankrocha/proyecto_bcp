package com.bcp.repositorio;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.bcp.entidad.Tarjeta;

public interface TarjetaRepository extends JpaRepository<Tarjeta, Integer>{

	

	@Query("Select x from Tarjeta x where x.cliente.idCliente= :id")
	public abstract  Tarjeta BuscarTarjetaPorCliente(@Param(value = "id") int id );
}
