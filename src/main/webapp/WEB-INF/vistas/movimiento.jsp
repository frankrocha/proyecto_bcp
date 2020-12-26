<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<meta name="keywords"
        content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 4 admin, bootstrap 4, css3 dashboard, bootstrap 4 dashboard, severny admin bootstrap 4 dashboard, frontend, responsive bootstrap 4 admin template, my admin design, my admin dashboard bootstrap 4 dashboard template">
<meta name="description"
        content="My Admin is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
<meta name="robots" content="noindex,nofollow">


<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>



<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<link rel="stylesheet" href="css/noti.css"/>

<link rel="canonical" href="https://www.wrappixel.com/templates/myadmin-lite/" />
    <!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <!-- Bootstrap Core CSS -->
    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style2.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<title>Intranet Colegio - Jorge Jacinto Gutarra</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
     
    
  
       <div id="page-wrapper"> 
       
         
        
		<div class="container-fluid" >
		
		
		    <div class="row bg-title">
                    <div class="col-lg-12">
                        <h4 class="page-title">Movimientos</h4>
                        <ol class="breadcrumb">
                            <li><a href="#">Inicio</a></li>
                            <li class="active">Movimientos</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
               </div>
               
                <div class="row">
                   <div class="col-md-6 col-xs-6 col-sm-6">
                   <div class="white-box">  
                         <h1 class="page-title">${sessionScope.cuenta.numero}</h1>
                          <h4 class="page-title">Cuenta</h4>
                         

                        
                  </div>
                   </div>
                   <div class="col-md-6 col-xs-6 col-sm-6">
                   <div class="white-box">     
                      <h1 class="page-title"><font  color="#82E0AA">S/ ${sessionScope.cuenta.saldo}</font> </h1>     
                      <h4 class="page-title">Saldo disponible</h4>           
                  </div>
                   </div>
               </div>
               
               <div class="row">
			          <div class="col-md-12 col-xs-12 col-sm-12">
			                        <div class="white-box">     
			                            <table id="tableAlumno" class="table table-hover" >
			                            
			                                <thead>
												<tr>
												
													<th>Fecha</th>
													<th>Descripcion</th>
													<th>Monto</th>
												</tr>
										   </thead>
											<tbody>	    
												 <c:forEach items="${sessionScope.historialCuentas}" var="x">
														<tr>	
															<td>${x.fechaRegistro}</td>
															<c:if test="${x.tipoMovimiento.idTipoMovimiento==3 }">
														           <td>Transferencia entre cuentas</td>
														           <td><font color="red">-${x.monto}</font></td>
										                     </c:if>
										                      <c:if test="${x.tipoMovimiento.idTipoMovimiento==2 }">
										                            <td>Transferencia entre cuentas</td>							                            
																	<td><font color="#82E0AA">${x.monto}</font></td>
										                      </c:if>
							                				<td>
																<button type='button' data-toggle='modal'  class='btn btn-success' id="id_verDetalle" onclick="editar('${x.idHistorialCuenta}');" >
							                                               Ver detalle
																</button>
															</td>
														</tr>
													</c:forEach>
											</tbody>
										</table>	
			                            
			                        </div>
			                 </div>
			     </div>
		</div>
	</div>
	
	   <div class="modal fade" id="idMensaje" >
			<div class="modal-dialog" style="width: 50%">

				<div class="modal-content">
				
				<div  id="idMensajeTexto" class="modal-body" style="padding: 30px 30px;align-content: center;">
					<h1><span class="glyphicon glyphicon-ok-sign"></span>BCP</h1>
			    </div>
			</div>
			</div>
		</div>
         <!-- /#page-wrapper -->
        <footer class="footer text-center"> 2020 &copy; Frank Alessandro Rocha Horna</footer>
        
        
        
<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});

function editar(id){	
	
	$.ajax({
		url:  'listaDetalleCuenta?id='+id,
		type: 'POST',
		dataType:'json',
		success:function(data){
			if(data != null){
				if(data.historialCuenta.tipoMovimiento.idTipoMovimiento==3)
		        	{
 
					salida = "Transeferencia a otra cuenta BCP : " + "<br><br>";
					salida += "Cuenta de origen: " +data.cuentaOrigen+ "<br><br>";
					salida += "Monto enviado: " +data.monto+ "<br><br>";
					salida += "Cuenta de destino: " +data.nombreCuentaDestino+"-"+data.cuentaDestino;

					idMensajeTexto.innerHTML = salida;


					}else
			             {
			             
						salida = "Transeferencia a otra cuenta BCP : " + "<br><br>";
						salida += "Cuenta de origen: " +data.cuentaOrigen+"-"+data.nombreCuentaDestino+"<br><br>";
						salida += "Monto recibido: " +data.monto+ "<br><br>";
					

						idMensajeTexto.innerHTML = salida;

			             }
				
				$("#idMensaje").modal("show");
				
			}else
				swal("Error al agregar la Boleta","","error");
				return false;
			},
		error: function (jqXhr) { 
			swal("Error en la conexión","","error");
		}
   });	
	   
};

//Al pulsar el botón agregar


</script>
//<script type="text/javascript">
//$.getJSON("cargaCuenta", {}, function(data){
	//$.each(data, function(index,item){
	//	$("#id_cuenta_ori").append("<option value="+item.numero+">"+ item.numero +"</option>");	
		//});

//});
//</script> 


    <!-- /#wrapper -->
    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>
    <!--Nice scroll JavaScript -->
    <script src="js/jquery.nicescroll.js"></script>
    <!--Wave Effects -->
    <script src="js/waves.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="js/myadmin.js"></script>

     		
</body>
</html>