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

<title>Configuracion de Notificaones</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />

     
       <div id="page-wrapper"> 
		<div class="container-fluid" >
		    <div class="row bg-title">
                    <div class="col-lg-12">
                        <h4 class="page-title">Configuración de Notificaciones</h4>
                        <ol class="breadcrumb">
                            <li><a href="#">Inicio</a></li>
                            <li class="active">Notificaiones</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
               </div>
               
                <div class="row">
                    <div class="col-md-12">
                        <div class="white-box">
                    
                                <form action="" id="id_form" method="post" > 
										  <div class="form-row align-items-center">
										         <div class="col-auto my-1">
										     
												    <div class="col-auto my-1">
														        <label class="custom-control-label" for="customControlAutosizing">Mostrar Notificaciones de transferencias</label>
														        <input id="check" class="form-check-input" type="checkbox"> Ocultar Notficicaiones
													      </div>
												    </div>	          
								  	   </div>		
		                     	</form>
                         </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-12">
                        <div class="white-box">
                    
                                <form action="" id="id_form" method="post" > 
										  <div class="form-row align-items-center">
										        <h4 class="page-title">Configuración de Tarjeta</h4>
										         <div class="col-auto my-1">
										             
										                <div class="form-row align-items-center">
									                    <h5>Compras por Internet   <label class="switch float-right"><input id="chk_compras_internet" name="chk_compras_internet"  type="checkbox" ><span class="slider round"></span></h5></label>
									                  </div>
										     
												       <div class="form-row align-items-center">
										                  <div class="card-body">
										                    <h5>Compras en el extranjero  <label class="switch float-right"><input id="chk_compras_extranjero" name="chk_compras_extranjero"  type="checkbox" ><span class="slider round"></span></h5></label>
										                  </div>
										                </div>
										
										             <div class="form-row align-items-center">
										                  <div class="card-body">
										                    <h5>Bloquear temporal de tarjeta  <label class="switch float-right"><input id="chk_tiempo_bloqueo_temporal_dias" name="chk_tiempo_bloqueo_temporal_dias"  type="checkbox" ><span class="slider round"></span></h5></label>
										                  </div>
										                </div>
										                
										                <div class="form-row align-items-center">
										              
										                    <h5>Limite de transferencia</h5>
		
														   <input type="text" name="p_limite_transferencias" id="p_limite_transferencias">
														
										                </div>
										  				<div class="card mb-1 py-0 border-left-secondary">
										                  <div class="card-body">
															<button type="submit" class="btn btn-primary">Guardar Cambios</button>                  
														  </div>
										                </div>      
										                 </div>    
								  	   </div>		
		                     	</form>
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