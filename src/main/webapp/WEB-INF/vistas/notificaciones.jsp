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

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<link rel="stylesheet" href="css/noti.css"/>

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

<title>Configuracion de Notificaones</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
  
  
    <form id="idFormElimina" action="eliminaNotificacion">
			  		<input type="hidden" id="id_elimina" name="id">
	  </form>
  
    <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-12">
                        <h4 class="page-title">Historial de Notificaciones</h4>
                        <ol class="breadcrumb">
                            <li><a href="#">Notificaciones</a></li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->

              
		        <div class="row">
			          <div class="col-md-12 col-xs-12 col-sm-12">
			                        <div class="white-box">     
			                            <table id="tableAlumno" class="table table-hover" >
											<tbody>
													    
												 <c:forEach items="${sessionScope.notificaciones}" var="x">
														<tr>	
															<td>${x.mensaje}</td>
															<td>${x.hora}</td>
															<td>
																<button type='button' data-toggle='modal' onclick="eliminar('${x.idHistorialNotificaciones}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																	<img src='images/delete.gif' width='auto' height='auto' />
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
            
            
            
				 <div class="modal fade" id="idModalElimina" >
					<div class="modal-dialog" style="width: 60%">
				 	
				 	<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Eliminar Notificacion</h4>
						</div>
				
						  <div class="modal-footer">
						    <button type="button" id="idBtnElimina" name="modalDe" class="btn btn-primary">ELIMINAR</button>
						    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
						  </div>
					</div>
				</div>
				</div>  
     </div>
           

    

<script type="text/javascript">


var checkbox = document.getElementById('check');
var notificacion = document.getElementById('idNotificaciones');
var contador = document.getElementById('noti_Counter');
checkbox.addEventListener( 'change', function() {
    if(this.checked) {
        var getInput = true;
        notificacion.style.display = 'none';
    	contador.style.display = 'none';
    	
        localStorage.setItem('checked','true');
        localStorage.setItem("nombre_variable",getInput);
      

    }else{
    	notificacion.style.display = 'block';
    	contador.style.display = 'block';
    	
        var getInpu = false;
        localStorage.setItem("nombre_variable",getInpu);
        localStorage.setItem('checked','false');
        
    }
});
if(localStorage.getItem('checked') === 'true'){
	
    checkbox.checked = true;
  
    
} else  {
	
    checkbox.checked = false;
    
}

</script>

<script type="text/javascript">
$("#idBtnElimina").click(function(){
	$("#idFormElimina").submit();
});

function eliminar(id){
	$('#idModalElimina').modal('show');
	$('#id_elimina').val(id);	
}

$(document).ready(function() {
    $('#tableAlumno').DataTable();
} );
</script>

<div class="container" >
 <div class="col-md-12" align="center"> 
 
 </div>
</div>  

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