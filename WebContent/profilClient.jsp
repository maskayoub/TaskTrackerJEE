<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
 <%@ page import="metier.user" %>
 <%
 		if (session.getAttribute("nom") == null){
				response.sendRedirect("login.jsp");
			}
 		else{
                     user ur = (user) session.getAttribute("nom");
	           		 String sessus = ur.getPrenom_user() + " " + ur.getNom_user();
	           		 String email  = ur.getEmail_user();
 		}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>TaskTracker</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
 <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
    <link rel="stylesheet" href="EmployéTemplate/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="EmployéTemplate/css/animate.css">
    
    <link rel="stylesheet" href="EmployéTemplate/css/owl.carousel.min.css">
    <link rel="stylesheet" href="EmployéTemplate/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="EmployéTemplate/css/magnific-popup.css">

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
 		if (session.getAttribute("nom") !=null ){
				
                     user ur = (user) session.getAttribute("nom");
	           		  sessus = ur.getPrenom_user() + " " + ur.getNom_user();
 		}
%>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="indexClient.jsp" class="nav-link">Accueil</a></li>
	          <li class="nav-item"><a href="pageContact.jsp" class="nav-link">Nous Contacter</a></li>
	          <li class="nav-item active"><a href="DossiersClient.php?action=dossCl" class="nav-link">Mes Dossiers</a></li>
	          <li class="nav-item cta mr-md-1"><a href="ProfilClient.php" class="nav-link" data-toggle="tooltip" data-placement="left" title="Mon Compte"><%=sessus%></a></li>
	          <li class="nav-item cta cta-colored"><a href="LogOut.php?action=deconn" class="nav-link">Déconnexion</a></li>

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
	            <h1 class="mb-5">Modifier Votre Profil:</h1>
	            <div>
	            	<img src="myButtons/scroll-down-icon-png-7.png" width="200" height="200"/>
	            </div>
	            <p class="intro">
	            
	           
	    	
	            

							<div class="ftco-search">
								<div class="row">
			            
				            
				            
				          </div>
				        </div>
			        </div>
	          </div>
	        </div>
	    	</div>
      </div>
      

    

  
		<section class="ftco-section bg-light">
		
			<div class="container">
				<div class="row">
       
          <div class="col-md-12 col-lg-8 mb-5">
          
			     <form action="ModifierInfos.php" method = post class="p-5 bg-white">
              
              
 				<div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="fullname">N#</label>
                  <input type="number" name="num_user" value="${num}" class="form-control" readonly>
                </div>
              </div>
              <input type="hidden"  name="username" value="${urname}">
              
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="fullname">Nom</label>
                  <input type="text" name="nom_user" value="${nom}" class="form-control" >
                </div>
              </div>
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="fullname">Prénom</label>
                  <input type="text" name="prenom_user" value="${prenom}" class="form-control" >
                </div>
              </div>
              
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="fullname">Email</label>
                  <input type="text" name="email_user" value="${email}" class="form-control" readonly>
                </div>
              </div>
              
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="fullname">GSM</label>
                  <input type="text" name="tel_user" value="${tel}" class="form-control">
                </div>
              </div>
              
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="font-weight-bold" for="fullname">Mot De Passe</label>
                  <input type="password" name="mdp_user" value="${mdp}" class="form-control" >
                </div>
              </div>


              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" name = "action" value="Confirmer Changements" class="btn btn-primary  py-2 px-5">
                </div>
              </div>

  
            </form>
          </div>

          <div class="col-lg-4">
        
            
            <div class="p-4 mb-3 bg-white">
              <h3 class="h5 text-black mb-3">Modification d'infos</h3>
              <p>N'oubliez bien de confirmer vos changements avant de quitter cette page.</p>
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