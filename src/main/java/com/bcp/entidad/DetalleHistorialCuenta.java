package com.bcp.entidad;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "detallehistorialcuenta")
public class DetalleHistorialCuenta {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private  int idDetalleHistorialCuenta;
    private String cuentaOrigen;
    private String cuentaDestino;
    private double monto;
    private String nombreCuentaDestino;
    
	
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idHistorialCuenta")
	private HistorialCuenta historialCuenta;
	
}
