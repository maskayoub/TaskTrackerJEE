<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
 <%@ page import="metier.user" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>TaskTracker</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="lastTemplate.css" rel="stylesheet" media="all">
    
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900" rel="stylesheet">
	<link href="TrackProgress.css" rel="stylesheet" media="all">
    <link href="tracking.scss" rel="stylesheet" media="all">

    <link rel="stylesheet" href="EmployéTemplate/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="EmployéTemplate/css/animate.css">
    
    <link rel="stylesheet" href="EmployéTemplate/css/owl.carousel.min.css">
    <link rel="stylesheet" href="EmployéTemplate/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="EmployéTemplate/css/magnific-popup.css">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    <link rel="stylesheet" href="EmployéTemplate/css/aos.css">

    <link rel="stylesheet" href="EmployéTemplate/css/ionicons.min.css">

    <link rel="stylesheet" href="EmployéTemplate/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="EmployéTemplate/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="EmployéTemplate/css/flaticon.css">
    <link rel="stylesheet" href="EmployéTemplate/css/icomoon.css">
    <link rel="stylesheet" href="EmployéTemplate/css/style.css">

    
  </head>
  <body>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">TaskTracker</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
<%	
		
		String sessus = " ";
		String email = " ";
		boolean etatConn = false;
			if (session.getAttribute("nom") != null){ 
 			user ur = (user) session.getAttribute("nom");
 			 sessus = ur.getPrenom_user() + " " + ur.getNom_user();
 			 email  = ur.getEmail_user();
 			etatConn = true;
 				}
		%>	
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="indexClient.jsp" class="nav-link">Accueil</a></li>
	          <li class="nav-item"><a href="about.html" class="nav-link">À Propos De Nous</a></li>
	          <li class="nav-item"><a href="pageContact.jsp" class="nav-link">Contactez Nous</a></li>
	          <c:if test="<%=etatConn%>">
	          <li class="nav-item"><a href="DossiersClient.php?action=dossCl" class="nav-link">Mes Dossiers</a></li>
	          <li class="nav-item cta mr-md-1"><a href="login.jsp" class="nav-link" data-toggle="tooltip" data-placement="left" title="Mon Compte"><%=sessus%></a></li>
	          <li class="nav-item cta cta-colored"><a href="LogOut.php?action=deconn" class="nav-link">Déconnexion</a></li>
	          </c:if>
	          <c:if test="<%=!etatConn%>">
	          <li class="nav-item cta mr-md-1"><a href="login.jsp" class="nav-link" >Connexion</a></li>
	          <li class="nav-item cta cta-colored"><a href="login.jsp" class="nav-link">Inscription</a></li>
	          </c:if>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
    <div class="hero-wrap js-fullheight">
      <div class="overlay"></div>
      <div class="container-fluid px-0">
      	<div class="row d-md-flex no-gutters slider-text align-items-end js-fullheight justify-content-end">
      	<c:if test="${folder.etat_doss != 'Echec De Traitement'}">
	      	<img class="one-third align-self-end order-md-last img-fluid" src="EmployéTemplate/images/undraw_work_time_lhoj.svg" alt="">
	    </c:if>
	    <c:if test="${folder.etat_doss == 'Echec De Traitement'}">
	      	<img class="one-third align-self-end order-md-last img-fluid" src="EmployéTemplate/images/failure.jpg" alt="">
	    </c:if>
	        <div class="one-forth d-flex align-items-center ftco-animate js-fullheight">
	        	<div class="text mt-5">
	        	<c:if test="${folder.etat_doss != 'Echec De Traitement'}">
	        		<p class="mb-4 mt-5 pt-5">Déjà <span class="number" data-number="24768">0</span> numéros suivis!</p>
	            <h1 class="mb-5">Suivez vos numéros rapidement et en en toute fiabilité!</h1>
	            <p class="intro">
	            </c:if>
	            <c:if test="${folder.etat_doss == 'Echec De Traitement'}">
	            <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	            <a href="indexClient.jsp"><img src="myButtons/android-system-back.png" width="100" height="100"/></a>
	            <br><br>
	            <h1 class="mb-5"> <span style="color:#6c63ff">Malheureusement,</span> <br>le traitement de votre dossier n'a pu être achevée, veuillez vérifier votre e-mail immédiatement pour plus d'infos!</h1>
	          
	           <p class="intro">
	           <br><br>
	    		 </c:if>
	            </p>
	            

							<div class="ftco-search">
								<div class="row">
			            
				            
				            
				          </div>
				        </div>
			        </div>
	          </div>
	        </div>
	    	</div>
      </div>
    </div>

    

    <section class="ftco-section">
    	<div class="container">
    		
       			<div>
	<div>
		<div>
<%-- <c:forEach items = "${taskches}" var = "r"> --%>
<!-- 	<article class="timeline-entry"> -->
		
<!-- 		<div class="timeline-entry-inner"> -->
<%-- 			<time class="timeline-time" datetime="${r.temp_fin}"></time> --%>
			
<!-- 			<div class="timeline-icon bg-success"> -->
<!-- 				<i class="entypo-feather"></i> -->
<!-- 			</div> -->
			
<!-- 			<div class="timeline-label"> -->
<%-- 				<h2><a href="#">${r.nom_tache}</a><span>  ${r.temp_fin}</span></h2> --%>
<!-- 				<p></p> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
<!-- 	</article> -->
<%-- </c:forEach> --%>



<c:if test="${folder.progression_doss gt 0}">
<div class="container-fluid">
  <br /><br />
  <ul class="list-unstyled multi-steps">
  <c:forEach items = "${taskches}" var = "r" varStatus="loop">
  <c:if test="${loop.last}">
  <c:if test="${folder.etat_doss != 'Echec De Traitement'}">
  <c:if test="${folder.progression_doss != 100}">
  		<li class="is-active">${r.nom_tache}</li>
  		<li>Prochaine Étape</li>
  </c:if>
  <c:if test="${folder.progression_doss == 100}">
  		<li>${r.nom_tache}</li>
  		<li>Succès</li>
  </c:if>
  </c:if>
  
  <c:if test="${folder.etat_doss == 'Echec De Traitement'}">
  		<li style="color:#ff0202">${r.nom_tache}</li>
  		<li style="color:#ff0202" class="is-active" >Échec</li>
  </c:if>
  </c:if>
 		 
  <c:if test="${!loop.last}"><li>${r.nom_tache}</li></c:if>
    
    </c:forEach>
	
  </ul>
</div>



<br>
	<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
          	<span class="subheading">Progrès ${percentage}%</span>
            <h2 class="mb-4"></h2>
          </div>
        </div>
</c:if>
</div>
	</div>
</div>
    	</div>
    </section>

    
		<section class="ftco-section-parallax">
      <div class="parallax-img d-flex align-items-center">
        <div class="container">
          <div class="row d-flex justify-content-center">
            <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
              <h2>Subcribe to our Newsletter</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
              <div class="row d-flex justify-content-center mt-4 mb-4">
                <div class="col-md-12">
                  <form action="#" class="subscribe-form">
                    <div class="form-group d-flex">
                      <input type="text" class="form-control" placeholder="Enter email address">
                      <input type="submit" value="Subscribe" class="submit px-3">
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
        	
          
          
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">TaskTracker ©</h2>
            	<div class="block-23 mb-3">
	           
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="EmployéTemplate/js/jquery.min.js"></script>
  <script src="EmployéTemplate/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="EmployéTemplate/js/popper.min.js"></script>
  <script src="EmployéTemplate/js/bootstrap.min.js"></script>
  <script src="EmployéTemplate/js/jquery.easing.1.3.js"></script>
  <script src="EmployéTemplate/js/jquery.waypoints.min.js"></script>
  <script src="EmployéTemplate/js/jquery.stellar.min.js"></script>
  <script src="EmployéTemplate/js/owl.carousel.min.js"></script>
  <script src="EmployéTemplate/js/jquery.magnific-popup.min.js"></script>
  <script src="EmployéTemplate/js/aos.js"></script>
  <script src="EmployéTemplate/js/jquery.animateNumber.min.js"></script>
  <script src="EmployéTemplate/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="EmployéTemplate/js/google-map.js"></script>
  <script src="EmployéTemplate/js/main.js"></script>
    
  </body>
</html>