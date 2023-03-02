 <%@ page import="metier.user" %>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
 
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>TaskTracker</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900" rel="stylesheet">

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
	          <li class="nav-item active"><a href="pageContact.jsp" class="nav-link">Nous Contacter</a></li>
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
    
    <div class="hero-wrap hero-wrap-2" style="background-image: url('EmployéTemplate/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
          <div class="col-md-8 ftco-animate text-center text-md-left mb-5">
          	<p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Accueil<i class="ion-ios-arrow-forward"></i></a></span> <span>Contact</span></p>
            <h1 class="mb-3 bread" >Contactez Nous</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section contact-section bg-light">
      <div class="container">
        <div class="row d-flex mb-5 contact-info">
          <div class="col-md-12 mb-4">
            <h2 class="h3">Informations Contact</h2>
          </div>
          <div class="w-100"></div>
          <div class="col-md-3">
            <p><span>Adresse:</span> Marjane 2,B.P. 15290 Al-Mansour, Meknès</p>
          </div>
          <div class="col-md-3">
            <p><span>Téléphone:</span> <a href="tel://1234567920">+ 2125354-67160</a></p>
          </div>
          <div class="col-md-3">
            <p><span>Email:</span> <a href="mailto:info@yoursite.com">contact@TaskTracker.com</a></p>
          </div>
          <div class="col-md-3">
            <p><span>Site Web</span> <a href="#">www.TaskTracker.com</a></p>
          </div>
        </div>
        <div class="row block-9">
          <div class="col-md-6 order-md-last d-flex">
            <form action="NousContacter.php" method = post class="bg-white p-5 contact-form">
              <div class="form-group">
                <input type="text" class="form-control" name="nomc" placeholder="Votre Nom">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name = "emailc" placeholder="Votre Email">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="sujetm"  placeholder="Sujet">
              </div>
              <div class="form-group">
                <textarea name="message" id="message" maxlength="295" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
              </div>
              <div class="form-group">
                <input type="submit" name = "action" value="Envoyer Message" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          
          </div>

          <div class="col-md-6 d-flex">
          	<div id="map" class="bg-white"></div>
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