package com.bcp.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.bcp.entidad.Cliente;
import com.bcp.entidad.ConfiguracionNotificacion;
import com.bcp.entidad.Cuenta;
import com.bcp.entidad.DetalleHistorialCuenta;
import com.bcp.entidad.HistorialCuenta;
import com.bcp.entidad.HistorialNotificaciones;
import com.bcp.entidad.Mensaje;
import com.bcp.entidad.Tarjeta;
import com.bcp.entidad.TipoMovimiento;
import com.bcp.entidad.Tranferencia;
import com.bcp.servicio.CuentaService;
import com.bcp.servicio.DetalleHistorialCuentaService;
import com.bcp.servicio.HistorialCuentaService;
import com.bcp.servicio.HistorialNotificacionesService;
import com.bcp.servicio.MensajeService;
import com.bcp.servicio.TarjetaService;
import com.bcp.servicio.ConfiguracionnotificacionsService;
import com.bcp.util.Constantes;


import lombok.extern.apachecommons.CommonsLog;



@Controller
@CommonsLog
public class MovimientoController {
	
	
	@Autowired
	private HistorialCuentaService historialCuentaService;

	@Autowired
	private CuentaService cuentaService;
	
	@Autowired
	private MensajeService mensajeService;
	
	@Autowired
	private HistorialNotificacionesService historialNotificacionesService;
	
	@Autowired
	private ConfiguracionnotificacionsService configuracionnotificacionsService;
	
	@Autowired
	private DetalleHistorialCuentaService detalleHistorialCuentaService;
	
	@Autowired
	private TarjetaService tarjetaService ;
	
	@RequestMapping("/verMovimiento")
	public String verMovimiento() {
		return "movimiento";
	}
	
	@RequestMapping("/verNotificaciones")
	public String verNotificaciones() {
		return "notificaciones";
	}
	

	//@RequestMapping("/cargaCuenta")
	//@ResponseBody
	//public List<Cuenta> listaCuenta(HttpSession session) {
		//Cliente objCliente = (Cliente)	session.getAttribute("objCliente");
	//	return cuentaService.listaCuentaPorCliente(objCliente.getIdCliente());
	//}
	// Opcion 2
	
	
	
	@RequestMapping("/buscaCuenta")
	@ResponseBody
	public String buscar(String cuentaDestino) {
		
		Cuenta cuenta = cuentaService.listaCuentaPorNumero(cuentaDestino);
		if(cuenta == null) {
			return "{\"valid\":false}";
		}else {
			return "{\"valid\":true}";
		}
		
	}
	
	@RequestMapping("/buscaCuentaCliente")
	@ResponseBody
	public String buscarCliente(String cuentaDestino) {
		
		log.info("buscaCuentaCliente"+cuentaDestino);
		Cuenta cuenta = cuentaService.listaCuentaPorNumero(cuentaDestino);
	
		if(cuenta == null) {
			return "{\"respuesta\":\"Cuenta Destino\"}";
		}else {
			String msg =cuenta.getCliente().getNombre()+ " "+cuenta.getCliente().getApellido();
			return "{\"respuesta\":\"Cuenta Destino - "+ msg+"\"}";
		}
	}
	
	@RequestMapping("/cargaCuenta2")
	public String listaCuenta2(HttpSession session) {
		Cliente objCliente = (Cliente)	session.getAttribute("objCliente");

		List<Cuenta> cuentas = cuentaService.listaCuentaPorCliente(objCliente.getIdCliente());
		session.setAttribute("cuentas", cuentas);
		
		return  "cuentas";
		
	}
	
	@RequestMapping("/listaDetalleCuenta")
	@ResponseBody
	public DetalleHistorialCuenta listaDetalleCuenta(int id,HttpSession session) {
		
		return detalleHistorialCuentaService.obtenerDetalleHistorial(id) ;

	}

	
	@RequestMapping("/cargaHistorialCuenta")
	public String cargaHistorialCuenta(Integer id, HttpSession session) {
		
		List<HistorialCuenta> historialcuentas = historialCuentaService.listaHistorialCuenta(id);
		
		Cuenta cuenta = cuentaService.listaCuentaPorIdCuenta(id);
		
		session.setAttribute("cuenta", cuenta);
		
		session.setAttribute("historialCuentas", historialcuentas);
		
		return  "movimiento";
		
	}
	
	@RequestMapping("/listaConfiguracion")
	@ResponseBody
	public List<ConfiguracionNotificacion> listaConfiguracion(HttpSession session) {
		
		Cliente objCliente = (Cliente)	session.getAttribute("objCliente");
		
		Tarjeta tarjeta = tarjetaService.BuscarTarjetaPorCliente(objCliente.getIdCliente()) ;

		return  configuracionnotificacionsService.listarConfiguracioPorTipoTarjeta(tarjeta.getIdTarjeta()); 
	
	}
	
	@RequestMapping("/listaNotificaciones")
	public String listaNotificaciones(HttpSession session) {
		
		Cliente objCliente = (Cliente)	session.getAttribute("objCliente");
		
		List<HistorialNotificaciones> notificaciones = historialNotificacionesService.listaPorCliente(objCliente.getIdCliente()) ;
		
		session.setAttribute("notificaciones", notificaciones);

		return "notificaciones";	
	}
	
	@RequestMapping("/listaNotificaciones2")
	@ResponseBody
	public List<HistorialNotificaciones> listaNotificaciones2(HttpSession session) {
		
		Cliente objCliente = (Cliente)	session.getAttribute("objCliente");

		return  historialNotificacionesService.listaPorCliente(objCliente.getIdCliente());	
	}
	
	@RequestMapping("/eliminaNotificacion")
	
	public String elimina(Integer id, HttpSession session) {
		
		try {
			
	 	Optional<HistorialNotificaciones> obj = historialNotificacionesService.buscarPorId(id);
			if(obj.isPresent()) {
				historialNotificacionesService.eliminaHistorialNotificaciones(id);
				session.setAttribute("MENSAJE", "Se eliminó correctamente");
			
	
			}else {
				session.setAttribute("MENSAJE", "No existe el ID");	
			}	
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
			
		}
           return "redirect:listaNotificaciones2"; 
	}
	
	@RequestMapping("/cargaNotificaciones")
	@ResponseBody
	public List<HistorialNotificaciones> listaNoficaciones(HttpSession session) {
		Cliente objCliente = (Cliente)	session.getAttribute("objCliente");
		return historialNotificacionesService.listaPorCliente(objCliente.getIdCliente());
	}
	
	@RequestMapping("/cargaNotificaciones2")
	@ResponseBody
	public List<HistorialNotificaciones> listaNoficaciones2(HttpSession session) {
		
		Cliente objCliente = (Cliente)	session.getAttribute("objCliente");
		return historialNotificacionesService.listaPorCliente2(objCliente.getIdCliente());
	
	}
	
	@RequestMapping("/verConfiguracion")
	public String verConfiguracion(HttpSession session) {
		return "configuracion";
	}
	
	@RequestMapping("/tranferencia")
	public String regTranferencia(Tranferencia x,HttpSession session) {
		
	  
		  double total;
		  DateFormat dateFormat = new SimpleDateFormat("HH:mm");
		  
		  Date date = new Date();
		  System.out.println("Hora actual: " + dateFormat.format(date));
	    
	    try {
	    	
			//------------------------------
			//Cuenta de Origen
			//------------------------------
			Cuenta objCuentaOrigen = cuentaService.listaCuentaPorNumero(x.getCuentaOrigen());
			Cuenta objCuentaDestino = cuentaService.listaCuentaPorNumero(x.getCuentaDestino());
			//Cuenta de Destino

			
			TipoMovimiento objTipoMov01 = new TipoMovimiento();
			objTipoMov01.setIdTipoMovimiento(Constantes.RETIRO);
			
			//validando monto no sea mayor al saldo actual 
			if(objCuentaOrigen.getSaldo()>=x.getMonto()&&objCuentaDestino!=null) {
				
				//------------------------------
				//Cuenta de Origen
				
				total =objCuentaOrigen.getSaldo()-x.getMonto();
				objCuentaOrigen.setSaldo(total);
				
				HistorialCuenta obj1 = new HistorialCuenta();
				obj1.setTipoMovimiento(objTipoMov01);
				obj1.setMonto(x.getMonto());
				obj1.setFechaRegistro(new Date());
				obj1.setCuenta(objCuentaOrigen);
				HistorialCuenta objHCO = historialCuentaService.registraHistorial(obj1);
				//-----------Se inserta el detalle del historial de cuenta 

				

				if (objHCO != null) {
					DetalleHistorialCuenta  detalleHistorialCuenta = new DetalleHistorialCuenta();
					
					detalleHistorialCuenta.setCuentaOrigen(x.getCuentaOrigen());
					detalleHistorialCuenta.setCuentaDestino(x.getCuentaDestino());
					detalleHistorialCuenta.setMonto(x.getMonto());
					detalleHistorialCuenta.setNombreCuentaDestino(objCuentaDestino.getCliente().getNombre()+" "+objCuentaDestino.getCliente().getApellido());
					detalleHistorialCuenta.setHistorialCuenta(objHCO);
					
					
					detalleHistorialCuentaService.registraDetalleHistorial(detalleHistorialCuenta);
				}
				//----fin detalle del historial de cuenta 
				
				Mensaje objMensaje = mensajeService.listaMensajePorTipo(Constantes.RETIRO);
				String texto1 = objMensaje.getTexto();
				texto1 = texto1.replaceFirst("p1", objCuentaOrigen.getNumero());
				texto1 = texto1.replaceFirst("p2", String.valueOf(x.getMonto()));
				texto1 = texto1.replaceFirst("p3", objCuentaOrigen.getTipoMoneda());
			
				
			
				
				                     HistorialNotificaciones obj3;
					            	  obj3  = new HistorialNotificaciones();
					            	  obj3.setMensaje(texto1);
					            	  obj3.setEstado("NO VISTO");
					            	  obj3.setHora(dateFormat.format(date)+"");
					            	  obj3.setCliente(objCuentaOrigen.getCliente());
						             historialNotificacionesService.registraHistorial(obj3); 

						             
						           //------------------------------
						     		//Cuenta de Destino
						     		//------------------------------
						     								     			
						     			double suma;
							     		TipoMovimiento objTipoMov02 = new TipoMovimiento();
							     		objTipoMov02.setIdTipoMovimiento(Constantes.DEPOSITO);	
							     		suma = objCuentaDestino.getSaldo() + x.getMonto();
							     		objCuentaDestino.setSaldo(suma);
							     		HistorialCuenta obj2 = new HistorialCuenta();
							     		obj2.setTipoMovimiento(objTipoMov02);
							     		obj2.setFechaRegistro(new Date());
							     		obj2.setMonto(x.getMonto());
							     		obj2.setCuenta(objCuentaDestino);
							     		HistorialCuenta objHCD=historialCuentaService.registraHistorial(obj2);
							    		//-----------Se inserta el detalle del historial de cuenta 

										

										if (objHCD != null) {
											DetalleHistorialCuenta  detalleHistorialCuentaDestino = new DetalleHistorialCuenta();
											
											detalleHistorialCuentaDestino.setCuentaOrigen(x.getCuentaOrigen());
											detalleHistorialCuentaDestino.setCuentaDestino(x.getCuentaDestino());
											detalleHistorialCuentaDestino.setMonto(x.getMonto());
											detalleHistorialCuentaDestino.setNombreCuentaDestino(objCuentaOrigen.getCliente().getNombre()+" "+objCuentaOrigen.getCliente().getApellido());
											detalleHistorialCuentaDestino.setHistorialCuenta(objHCD);
											
											
											detalleHistorialCuentaService.registraDetalleHistorial(detalleHistorialCuentaDestino);
										}
										//----fin detalle del historial de cuenta 
										
	
							     		
							     		Mensaje objMensaje2 = mensajeService.listaMensajePorTipo(Constantes.DEPOSITO);
							     		String texto2 = objMensaje2.getTexto();
							     		texto2 = texto2.replaceFirst("p1", objCuentaDestino.getNumero());
							     		texto2 = texto2.replaceFirst("p2", String.valueOf(x.getMonto()));
							     		texto2 = texto2.replaceFirst("p3", objCuentaDestino.getTipoMoneda());

							     		
							     		 HistorialNotificaciones obj4;
							     			
							     			            	 obj4  = new HistorialNotificaciones();
							     				             obj4.setMensaje(texto2);
							     				             obj4.setEstado("NO VISTO");
							     				             obj4.setHora(dateFormat.format(date)+"");
							     				             obj4.setCliente(objCuentaDestino.getCliente());
							     				             historialNotificacionesService.registraHistorial(obj4);    
							     				             
							     				session.setAttribute("saldo_correcto", "Transeferencia realizado correctamente");

							     				
			}else if(objCuentaOrigen.getSaldo()>=x.getMonto()&&objCuentaDestino==null) {
				
				session.setAttribute("saldo_error", "Cuenta Destino no existe");
				
			}else if(objCuentaOrigen.getSaldo()<x.getMonto()) {
				
				session.setAttribute("saldo_error", "Saldo insuficiente");
			}
			
		} catch (Exception e) {
	         e.printStackTrace();
			session.setAttribute("saldo_error", "Error en la tranferencia");
		}
	    
		return "redirect:cargaCuenta2";
	}

	@RequestMapping("/salidaTransferecia")
	public String regTranferencia() {
		return "movimiento";
	}

	
}
