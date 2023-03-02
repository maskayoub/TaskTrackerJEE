 <%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
 <%@ page import="metier.user" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Task Tracker</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="EmployéTemplate/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="EmployéTemplate/css/animate.css">
    
    <link rel="stylesheet" href="EmployéTemplate/css/owl.carousel.min.css">
    <link rel="stylesheet" href="EmployéTemplate/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="EmployéTemplate/css/magnific-popup.css">
<link href="progressBar.css" rel="stylesheet" media="all">

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
	      <a class="navbar-brand" href="indexClient.jsp">TaskTracker</a>
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
	          <li class="nav-item active"><a href="indexClient.jsp" class="nav-link">Accueil</a></li>
	          <li class="nav-item"><a href="pageContact.jsp" class="nav-link">Nous Contacter</a></li>
	          <c:if test="<%=etatConn%>">
	          <li class="nav-item"><a href="DossiersClient.php?action=dossCl" class="nav-link">Mes Dossiers</a></li>
	          <li class="nav-item cta mr-md-1"><a href="ProfilClient.php" class="nav-link" data-toggle="tooltip" data-placement="left" title="Mon Compte"><%=sessus%></a></li>
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
	      	<img class="one-third align-self-end order-md-last img-fluid" src="EmployéTemplate/images/undraw_work_time_lhoj.svg" alt="">
	        <div class="one-forth d-flex align-items-center ftco-animate js-fullheight">
	        	<div class="text mt-5">
	        		<p class="mb-4 mt-5 pt-5">Déjà <span class="number" data-number="24768">0</span> numéros suivis!</p>
	            <h1 class="mb-5">Suivez vos numéros rapidement et en en toute fiabilité!</h1>
	            <p class="intro">
	     
	            </p>

							<div class="ftco-search">
								<div class="row">
			            <div class="col-md-12 nav-link-wrap">
				            <div class="nav nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
				              <a class="nav-link active mr-md-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Suivre Un Numéro</a>

				              <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Réclamer Retard</a>

				            </div>
				          </div>
				          <div class="col-md-12 tab-wrap">
				            
				            <div class="tab-content p-4" id="v-pills-tabContent">

				              <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
				              	<form action = "recherche.php" method = post class="search-job">
				              		<div class="row no-gutters">
				              			<div class="col-md mr-md-2">
				              				<div class="form-group">
					              				<div class="form-field">
					              					<div class="icon"><span class="icon-briefcase"></span></div>
									                <input type="text" class="form-control" name="numtrack" placeholder="Numéro">
									              </div>
								              </div>
				              			</div>
				              			
				              			
				              			<div class="col-md">
				              				<div class="form-group">
				              					<div class="form-field">
								                	<button type = "submit" name = "action"  value = "confnum" class="form-control btn btn-secondary">Rechercher</button>
									              </div>
								              </div>
				              			</div>
				              		</div>
				              	</form>
				              </div>

				              <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-performance-tab">
				              	<form action="#" class="search-job">
				              		<div class="row">
				              			<div class="col-md">
				              				<div class="form-group">
					              				<div class="form-field">
					              					
									              </div>
								              </div>
				              			</div>
				              			
				              			
				              			<div class="col-md">
				              				<div class="form-group">
				              					<div class="form-field" align="center">
									               <button class="form-control btn btn-secondary"><a href="pageContact.jsp" style="color:white">Section Contact</a></button>
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
	          </div>
	        </div>
	    	</div>
      </div>
    </div>

    <section class="ftco-section services-section bg-primary">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-resume"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Suivez Tous Vos Dossiers</h3>
                <p>Il n'y a rien de plus facile que cela.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-collaboration"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Facile À Utiliser</h3>
                <p>Tout le monde peut facilement utiliser notre site Web sans avoir besoin d'aide!</p>
              </div>
            </div>    
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-promotions"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Vous Pouvez Suivre Chaque Étape</h3>
                <p>Chaque changement apparaît en temps réel et instantanément.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-employee"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Création De Compte</h3>
                <p>Tous vos dossiers soumis précédemment apparaisseront automatiquement dans votre compte nouvellement créé!</p>
              </div>
            </div>      
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section img" style="background-image: url(EmployéTemplate/images/bg_1.jpg); background-position: top center;">
    	<div class="container">
    		<div class="row">
    			<div class="col-md-6">
    				<div class="browse-job p-5">
    					<span class="icon-search2 icon"></span>
    					<span class="subheading">Suivez Vos Dossiers</span>
    					<h2>Vérifier La Progression De Votre Dossier En Temps Réel</h2>
    					<p>Notre site Web est conçu pour être aussi simple que possible à utiliser, vous pouvez voir la progression de votre dossier facilement et en temps réel sans même avoir besoin de vous connecter.
Vous avez également la possibilité de créer un compte et tous vos dossiers soumis précédemment apparaisseront automatiquement dans votre compte tant que vous utilisez le même e-mail que vous avez soumis avec votre dossier.</p>
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