<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<link rel="stylesheet" href="css/noti.css"/>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>


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
                        <h4 class="page-title">Cuentas</h4>
                        <ol class="breadcrumb">
                            <li><a href="#">Inicio</a></li>
                            <li class="active">Cuentas</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
               </div>
              
            
              
               
               
                <div class="row">        
		                      <div class="col-md-12 col-xs-12 col-sm-12">             
		                        <div class="white-box">                         
			                           <h3>Tus Cuentas</h3>
			                            <div class="message-center">
			                
			                                <c:forEach items="${sessionScope.cuentas}" var="x">
			                                                           
				                                    <div class="mail-contnet">
				                                      <a href="cargaHistorialCuenta?id=${x.idCuenta}"  >    
				                                        <span class="mail-desc" style="font-size: 16px;">${x.numero}</span> 
				                                         Saldo disponible:<span  class="mail-desc">${x.saldo}</span> 
				                                         </a>	                                   
				                                          <button type='button' data-toggle='modal' onclick="editar('${x.numero}');" class='btn btn-success'  style='background:#566673;'>Entrar</button>

				                                    </div>
			                                  
			                               </c:forEach>  	                            
			                            </div>
		                        </div>
		                    </div> 
                         </div>
                    </div>
                </div>
                
               <div class="modal fade" id="idModalActualiza" >
				<div class="modal-dialog" style="width: 60%">
					<!-- Modal content-->
					<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span>Realizar Tranferencia</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form" accept-charset="UTF-8"  action="tranferencia" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Transferencia</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                            
		                                <div class="panel-body">	                                  
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">Cuenta</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_cuenta_ori" readonly="readonly"  name="cuentaOrigen" type="text" maxlength="20"/>
		                                        </div>
		                                     </div>
		                                    <div class="form-group">
		                                         <label class="col-lg-3 control-label" for="id_act_nombre">Monto</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_monto" name="monto" placeholder="Ingrese el monto" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                         <label class="col-lg-3 control-label" for="id_act_nombre" id="id_cuenta">Cuenta destino</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_cuenta_des" name="cuentaDestino" placeholder="Ingrese la cuenta a tranferir" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary" id="idBtnActualiza">Transferir</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </form>   
				</div>
			</div>
		</div>
		
		</div> 
         <!-- /#page-wrapper -->
        <footer class="footer text-center"> 2020 &copy; Frank Alessandro Rocha Horna</footer>
        
        
   

        
<script type="text/javascript">


	if(${sessionScope.saldo_correcto != null}){
		Swal.fire('${sessionScope.saldo_correcto}', "Click en el boton para cerrar", "success");
		<c:remove var = "saldo_correcto"/>
	}else{
		Swal.fire('${sessionScope.saldo_error}', "Click en el boton para cerrar", "warning");
		<c:remove var = "saldo_error"/>

	}
	

</script>

<script type="text/javascript">
function editar(numero){	
	$('#id_cuenta_ori').val(numero);
	$('#idModalActualiza').modal("show");
};

$("#id_cuenta_des").keyup(function(){
	  var var_cuenta=$("#id_cuenta_des").val();
	  console.log(var_cuenta.length)
	  if(var_cuenta.length > 14){

		  $.getJSON("buscaCuentaCliente", {"cuentaDestino":var_cuenta}, function(data){

			  $("#id_cuenta").text(data.respuesta);
			  console.log(data);
				
		  });  
      }
});



</script> 

<script type="text/javascript">
$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        cuentaOrigen:{
               selector:"#id_cuenta_ori",
               validators:{
                        notEmpty :{
                              message: "La cuenta origen es obligatorio"
                            }
                   }
            },
            monto:{
                selector:"#id_monto",
                validators:{
                         notEmpty :{
                               message: "El monto es obligatorio"
                             },
                             regexp :{
             					regexp: /^(([0-9]*)|([0-9]*[\.][0-9]))$/ ,
                                 message: 'El monto es entero o decimal con un dígito'
             				}
                    }
             },
             cuentaDestino:{
                 selector:"#id_cuenta_des",
                 validators:{
                          notEmpty :{
                                message: "La cuenta destino es obligatoria"
                             },
                             regexp :{
              					regexp: /^[0-9]{15}$/ ,
                                  message: 'La cuenta destino tiene 15 digitos'
              				},
              				remote :{
                        	    delay: 1000,
                        	 	url: 'buscaCuenta',
                        	 	message: 'La cuenta destino no existe'
                         }
                             
                     }
              },
    }   
});
</script>

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