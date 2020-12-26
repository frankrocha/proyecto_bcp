<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

      <!-- Preloader -->
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" style="margin-bottom: 0">
            <div class="navbar-header"> <a class="navbar-toggle hidden-sm hidden-md hidden-lg "
                    href="javascript:void(0)" data-toggle="collapse" data-target=".navbar-collapse"><i
                        class="ti-menu"></i></a>
                <div class="top-left-part"><a class="logo" href="dashboard.html"><i
                            class="glyphicon glyphicon-fire"></i>&nbsp;<span class="hidden-xs">BCP</span></a></div>
                <ul class="nav navbar-top-links navbar-left hidden-xs">
                    <li><a href="javascript:void(0)" class="open-close hidden-xs hidden-lg waves-effect waves-light"><i
                                class="ti-arrow-circle-left ti-menu"></i></a></li>
                </ul>
                <ul class="nav navbar-top-links navbar-right pull-right">
                    <li  id="noti_Container" >
                         <div id="noti_Counter"></div>   <!--SHOW NOTIFICATIONS COUNT.-->
                         
									                <a id="noti_Button" href=""><samp class="bubble"><img src='images/camp.png' width='24px' height='24px' /></samp></a>
									                <div id='notifications'>
								                           <div class="row">
															          <div class="col-md-12 col-xs-12 col-sm-12">
															                        <div class="white-box">   
															                                 <h3>Notificaciones</h3>               
															                               <div  class="message-center" id='idNotificaciones'>				   
													     
												                                     	    </div>
															                         </div>
															                    </div>
															              </div>

									                            	    	
													   
									                   	
									                   	
									                  <div class="seeAll"><a href="listaNotificaciones">Ver Todas las notificaciones</a></div>  
							                        </div>
                    </li>
                    
                    <li>
                        <a class="profile-pic" href="#"><b class="hidden-xs">Bienvenido Sr(a): ${sessionScope.objCliente.nombre}  ${sessionScope.objCliente.apellido}</b> </a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-header -->
            <!-- /.navbar-top-links -->
            <!-- /.navbar-static-side -->
        </nav>
        <div class="navbar-default sidebar nicescroll" role="navigation">
            <div class="sidebar-nav navbar-collapse ">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search hidden-sm hidden-md hidden-lg">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="fafasdsa">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><i class="ti-search"></i> </button>
                            </span>
                        </div>
                    </li>
                    <li>
                        <a href="cargaCuenta2" class="waves-effect"><i class="ti-user fa-fw"></i>Cuentas</a>
                    </li>
                    <li>
                        <a href="verConfiguracion" class="waves-effect"><i class="ti-layout fa-fw"></i>Configuracion</a>
                    </li>                       
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        
                <div class="white-box">
                              <div class="message-center">
                              <a href="#">
                                    <div class="user-img">
                                        <img src="images/users/pawandeep.jpg" alt="user" class="img-circle"> <span
                                            class="profile-status online pull-right"></span>
                                    </div>
                                    <div class="mail-contnet">
                                        <h5>Pavan kumar</h5>
                                        <span class="mail-desc">Just see the my admin!</span> <span class="time">9:30
                                            AM</span>
                                    </div>
                                </a>
                               </div> 
                </div>
      
  
    </div>
    


<script  type="text/javascript">
var notificacion = document.getElementById('idNotificaciones');
var contador = document.getElementById('noti_Counter');

if(localStorage.getItem('checked') === 'true'){
	
	notificacion.style.display = 'none';
	contador.style.display = 'none';
	
} else  {
	
	notificacion.style.display = 'block';
	contador.style.display = 'block';
}
</script>
<script type="text/javascript">
cargarNotificaciones();
cargarNumero();
function cargarNotificaciones(){
	
	var idNotificaciones = document.getElementById('idNotificaciones');
	  fetch('cargaNotificaciones2')
	  .then(response => response.json())
	  .then(data => {
	   
	   
	    let resultado = '';
	    for (let i in data){

	    	 resultado +="<table  class='table table-hover' >"+''+
				"<tbody>"+''+
	                 		"<tr>"+''+	
								"<td>"+data[i].mensaje+"</td>"+''+
								"<td>"+data[i].hora+"</td>"+''+
								"<td>"+''+
									"<button  id='elimina' type='button' data-toggle='modal' onclick='elimina("+data[i].idHistorialNotificaciones+");' class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>"+''+
										"<img src='images/delete.gif' width='auto' height='auto' />"+''+
									"</button>"+''+
								"</td>"+''+
							"</tr>"+''+	
				"</tbody>"+''+
			"</table>";
			
			
	    }
	    idNotificaciones.innerHTML = resultado;
		  
	  });
	     
	  
	}


function cargarNumero(){
	//var cantidad = document.getElementById("noti_Counter");
	var idNotificaciones = document.getElementById('idNotificaciones');
	  fetch('cargaNotificaciones2')
	  .then(response => response.json())
	  .then(data => {
	   
		  var contador = 0; 
	  
	    for (let i in data){
	      contador +=1;
	    }
	    
	    $('#noti_Counter')
        .css({ opacity: 0 })
        .text(contador)  // AÑADIR VALOR DINÁMICO (PUEDE EXTRAER DATOS DE LA BASE DE DATOS O XML).
        .css({ top: '14px' })
        .animate({ right: '0px', opacity: 1 }, 500);

		  
	  });
	     
	  console.log(contador);
	}



function elimina (id){
	  
	  fetch('eliminaNotificacion?id='+id).
	  then(response => response.json()).
	  then(data => {
		  cargarNumero();
	    cargarNotificaciones();
	    
	  });
	}
</script>

<script>


	$(document).ready(function () {
		
    	
       // MOSTRAR ANIMADO EL CONTADOR DE NOTIFICACIONES
       

        $('#noti_Button').click(function () {

            // TOGGLE (MOSTRAR U OCULTAR) VENTANA DE NOTIFICACIONES.
            $('#notifications').fadeToggle('fast', 'linear', function () {
                if ($('#notifications').is(':hidden')) {
                    $('#noti_Button').css('background-color');
                }
                // // CAMBIAR EL COLOR DE FONDO DEL BOTÓN. 
                else $('#noti_Button').css('background-color');
            });

           // $('#noti_Counter').fadeOut('slow');     // OCULTAR EL MOSTRADOR.

            return false;
        });

        // OCULTAR NOTIFICACIONES CUANDO SE HAGA CLIC EN CUALQUIER LUGAR DE LA PÁGINA. 
       // $(document).click(function () {
           // $('#notifications').hide();

           // COMPRUEBE SI EL CONTADOR DE NOTIFICACIONES ESTÁ OCULTO.
         //   if ($('#noti_Counter').is(':hidden')) {
            //    // // CAMBIAR EL COLOR DE FONDO DEL BOTÓN.
             //   $('#noti_Button').css('background-color');
           // }
        //});

        $('#notificati').click(function () {
            return false;       // NO HACER NADA CUANDO SE HAGA CLIC EN EL CONTENEDOR
        });   


       
    });

	

  </script>
  
  

