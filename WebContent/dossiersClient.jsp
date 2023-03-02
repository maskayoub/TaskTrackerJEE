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
	            <h1 class="mb-5">Tous les dossiers soumis avec l'email de ce compte:</h1>
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
				
					<div class="col-lg-9 pr-lg-5">
						<div class="row justify-content-center pb-3">
		          <div class="col-md-12 heading-section ftco-animate">
		          	<span class="subheading">Dossiers Récents</span>
		            <h2 class="mb-4">Vos Dossiers</h2>
		          </div>
		        </div>
						<div class="row">
						<c:forEach items = "${modd.dossier}" var = "r">
							<div class="col-md-12 ftco-animate">
		            <div class="job-post-item py-4 d-block d-lg-flex align-items-center">
		              <div class="one-third mb-4 mb-md-0">
		                <div class="job-post-item-header d-flex align-items-center">
		                  <h2 class="mr-3 text-black"><a href="#"><span style="font-size: 60%">#${r.num_doss}</span> ${r.nom_doss}</a></h2>
		                  <div class="badge-wrap">
		                  <c:if test="${r.etat_doss == 'Echec De Traitement'}">
		                  <span class="bg-danger text-white badge py-2 px-3">Échec</span>
		                   </c:if>
		                   <c:if test="${r.progression_doss == 100}">
		                   <span class="bg-primary text-white badge py-2 px-3">Succès</span>
		                   </c:if>
		                   <c:if test="${r.etat_doss != 'Echec De Traitement'}">
		                   <c:if test="${r.progression_doss lt 100}">
		                   <span class="bg-warning text-dark badge py-2 px-3">${r.progression_doss} %</span>
		                   </c:if>
		                   </c:if>
		                  </div>
		                </div>
		                <div class="job-post-item-body d-block d-md-flex">
		                  <div class="mr-3"><span class="icon-track_changes"></span> <a href="#">${r.etat_doss}</a></div>
		                  <div><span class="icon-date_range"></span> <span>${r.date_ajout}</span></div>
		                </div>
		              </div>

		              <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
		              <div data-toggle="tooltip" data-placement="top" title="Annuler Dossier">
			               
		                </div>
		                <br>
		                <a href="SuivreDossier.php?ref1=${r.num_doss}" class="btn btn-primary py-2">Suivre</a>
		              </div>
		              </div>
		          </div>
		          <!-- end -->
		          
		      </c:forEach>
		      </div>
		          </div>
		          
				
<!-- 							<div class="col-md-12 ftco-animate"> -->
<!-- 		            <div class="job-post-item py-4 d-block d-lg-flex align-items-center"> -->
<!-- 		              <div class="one-third mb-4 mb-md-0"> -->
<!-- 		                <div class="job-post-item-header d-flex align-items-center"> -->
<!-- 		                  <h2 class="mr-3 text-black"><a href="#">Full Stack Developer</a></h2> -->
<!-- 		                  <div class="badge-wrap"> -->
<!-- 		                   <span class="bg-warning text-white badge py-2 px-3">Fulltime</span> -->
<!-- 		                  </div> -->
<!-- 		                </div> -->
<!-- 		                <div class="job-post-item-body d-block d-md-flex"> -->
<!-- 		                  <div class="mr-3"><span class="icon-layers"></span> <a href="#">Google, Inc.</a></div> -->
<!-- 		                  <div><span class="icon-my_location"></span> <span>Western City, UK</span></div> -->
<!-- 		                </div> -->
<!-- 		              </div> -->

<!-- 		              <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0"> -->
<!-- 		              	<div> -->
<!-- 			                <a href="#" class="icon text-center d-flex justify-content-center align-items-center icon mr-2"> -->
<!-- 			                	<span class="icon-heart"></span> -->
<!-- 			                </a> -->
<!-- 		                </div> -->
<!-- 		                <a href="job-single.html" class="btn btn-primary py-2">Apply Job</a> -->
<!-- 		              </div> -->
<!-- 		            </div> -->
<!-- 		          </div>end -->

<!-- 		          <div class="col-md-12 ftco-animate"> -->
<!-- 		            <div class="job-post-item py-4 d-block d-lg-flex align-items-center"> -->
<!-- 		              <div class="one-third mb-4 mb-md-0"> -->
<!-- 		                <div class="job-post-item-header d-flex align-items-center"> -->
<!-- 		                  <h2 class="mr-3 text-black"><a href="#">Open Source Interactive Developer</a></h2> -->
<!-- 		                  <div class="badge-wrap"> -->
<!-- 		                   <span class="bg-info text-white badge py-2 px-3">Freelance</span> -->
<!-- 		                  </div> -->
<!-- 		                </div> -->
<!-- 		                <div class="job-post-item-body d-block d-md-flex"> -->
<!-- 		                  <div class="mr-3"><span class="icon-layers"></span> <a href="#">New York Times</a></div> -->
<!-- 		                  <div><span class="icon-my_location"></span> <span>Western City, UK</span></div> -->
<!-- 		                </div> -->
<!-- 		              </div> -->

<!-- 		              <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0"> -->
<!-- 		              	<div> -->
<!-- 			                <a href="#" class="icon text-center d-flex justify-content-center align-items-center icon mr-2"> -->
<!-- 			                	<span class="icon-heart"></span> -->
<!-- 			                </a> -->
<!-- 		                </div> -->
<!-- 		                <a href="job-single.html" class="btn btn-primary py-2">Apply Job</a> -->
<!-- 		              </div> -->
<!-- 		            </div> -->
<!-- 		          </div>end -->

<!-- 		          <div class="col-md-12 ftco-animate"> -->
<!-- 		            <div class="job-post-item py-4 d-block d-lg-flex align-items-center"> -->
<!-- 		              <div class="one-third mb-4 mb-md-0"> -->
<!-- 		                <div class="job-post-item-header d-flex align-items-center"> -->
<!-- 		                  <h2 class="mr-3 text-black"><a href="#">Frontend Development</a></h2> -->
<!-- 		                  <div class="badge-wrap"> -->
<!-- 		                   <span class="bg-secondary text-white badge py-2 px-3">Internship</span> -->
<!-- 		                  </div> -->
<!-- 		                </div> -->
<!-- 		                <div class="job-post-item-body d-block d-md-flex"> -->
<!-- 		                  <div class="mr-3"><span class="icon-layers"></span> <a href="#">Facebook, Inc.</a></div> -->
<!-- 		                  <div><span class="icon-my_location"></span> <span>Western City, UK</span></div> -->
<!-- 		                </div> -->
<!-- 		              </div> -->

<!-- 		              <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0"> -->
<!-- 		              	<div> -->
<!-- 			                <a href="#" class="icon text-center d-flex justify-content-center align-items-center icon mr-2"> -->
<!-- 			                	<span class="icon-heart"></span> -->
<!-- 			                </a> -->
<!-- 		                </div> -->
<!-- 		                <a href="job-single.html" class="btn btn-primary py-2">Apply Job</a> -->
<!-- 		              </div> -->
<!-- 		            </div> -->
<!-- 		          </div>end -->

<!-- 		          <div class="col-md-12 ftco-animate"> -->
<!-- 		            <div class="job-post-item py-4 d-block d-lg-flex align-items-center"> -->
<!-- 		              <div class="one-third mb-4 mb-md-0"> -->
<!-- 		                <div class="job-post-item-header d-flex align-items-center"> -->
<!-- 		                  <h2 class="mr-3 text-black"><a href="#">Open Source Interactive Developer</a></h2> -->
<!-- 		                  <div class="badge-wrap"> -->
<!-- 		                   <span class="bg-danger text-white badge py-2 px-3">Temporary</span> -->
<!-- 		                  </div> -->
<!-- 		                </div> -->
<!-- 		                <div class="job-post-item-body d-block d-md-flex"> -->
<!-- 		                  <div class="mr-3"><span class="icon-layers"></span> <a href="#">New York Times</a></div> -->
<!-- 		                  <div><span class="icon-my_location"></span> <span>Western City, UK</span></div> -->
<!-- 		                </div> -->
<!-- 		              </div> -->

<!-- 		              <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0"> -->
<!-- 		              	<div> -->
<!-- 			                <a href="#" class="icon text-center d-flex justify-content-center align-items-center icon mr-2"> -->
<!-- 			                	<span class="icon-heart"></span> -->
<!-- 			                </a> -->
<!-- 		                </div> -->
<!-- 		                <a href="job-single.html" class="btn btn-primary py-2">Apply Job</a> -->
<!-- 		              </div> -->
<!-- 		            </div> -->
<!-- 		          </div>end -->

<!-- 		         	<div class="col-md-12 ftco-animate"> -->
<!-- 		            <div class="job-post-item py-4 d-block d-lg-flex align-items-center"> -->
<!-- 		              <div class="one-third mb-4 mb-md-0"> -->
<!-- 		                <div class="job-post-item-header d-flex align-items-center"> -->
<!-- 		                  <h2 class="mr-3 text-black"><a href="#">Full Stack Developer</a></h2> -->
<!-- 		                  <div class="badge-wrap"> -->
<!-- 		                   <span class="bg-warning text-white badge py-2 px-3">Fulltime</span> -->
<!-- 		                  </div> -->
<!-- 		                </div> -->
<!-- 		                <div class="job-post-item-body d-block d-md-flex"> -->
<!-- 		                  <div class="mr-3"><span class="icon-layers"></span> <a href="#">Google, Inc.</a></div> -->
<!-- 		                  <div><span class="icon-my_location"></span> <span>Western City, UK</span></div> -->
<!-- 		                </div> -->
<!-- 		              </div> -->

<!-- 		              <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0"> -->
<!-- 		              	<div> -->
<!-- 			                <a href="#" class="icon text-center d-flex justify-content-center align-items-center icon mr-2"> -->
<!-- 			                	<span class="icon-heart"></span> -->
<!-- 			                </a> -->
<!-- 		                </div> -->
<!-- 		                <a href="job-single.html" class="btn btn-primary py-2">Apply Job</a> -->
<!-- 		              </div> -->
<!-- 		            </div> -->
<!-- 		          </div>end -->

<!-- 		          <div class="col-md-12 ftco-animate"> -->
<!-- 		            <div class="job-post-item py-4 d-block d-lg-flex align-items-center"> -->
<!-- 		              <div class="one-third mb-4 mb-md-0"> -->
<!-- 		                <div class="job-post-item-header d-flex align-items-center"> -->
<!-- 		                  <h2 class="mr-3 text-black"><a href="#">Open Source Interactive Developer</a></h2> -->
<!-- 		                  <div class="badge-wrap"> -->
<!-- 		                   <span class="bg-info text-white badge py-2 px-3">Freelance</span> -->
<!-- 		                  </div> -->
<!-- 		                </div> -->
<!-- 		                <div class="job-post-item-body d-block d-md-flex"> -->
<!-- 		                  <div class="mr-3"><span class="icon-layers"></span> <a href="#">New York Times</a></div> -->
<!-- 		                  <div><span class="icon-my_location"></span> <span>Western City, UK</span></div> -->
<!-- 		                </div> -->
<!-- 		              </div> -->

<!-- 		              <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0"> -->
<!-- 		              	<div> -->
<!-- 			                <a href="#" class="icon text-center d-flex justify-content-center align-items-center icon mr-2"> -->
<!-- 			                	<span class="icon-heart"></span> -->
<!-- 			                </a> -->
<!-- 		                </div> -->
<!-- 		                <a href="job-single.html" class="btn btn-primary py-2">Apply Job</a> -->
<!-- 		              </div> -->
<!-- 		            </div> -->
<!-- 		          </div>end -->

<!-- 		          <div class="col-md-12 ftco-animate"> -->
<!-- 		            <div class="job-post-item py-4 d-block d-lg-flex align-items-center"> -->
<!-- 		              <div class="one-third mb-4 mb-md-0"> -->
<!-- 		                <div class="job-post-item-header d-flex align-items-center"> -->
<!-- 		                  <h2 class="mr-3 text-black"><a href="#">Frontend Development</a></h2> -->
<!-- 		                  <div class="badge-wrap"> -->
<!-- 		                   <span class="bg-secondary text-white badge py-2 px-3">Internship</span> -->
<!-- 		                  </div> -->
<!-- 		                </div> -->
<!-- 		                <div class="job-post-item-body d-block d-md-flex"> -->
<!-- 		                  <div class="mr-3"><span class="icon-layers"></span> <a href="#">Facebook, Inc.</a></div> -->
<!-- 		                  <div><span class="icon-my_location"></span> <span>Western City, UK</span></div> -->
<!-- 		                </div> -->
<!-- 		              </div> -->

<!-- 		              <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0"> -->
<!-- 		              	<div> -->
<!-- 			                <a href="#" class="icon text-center d-flex justify-content-center align-items-center icon mr-2"> -->
<!-- 			                	<span class="icon-heart"></span> -->
<!-- 			                </a> -->
<!-- 		                </div> -->
<!-- 		                <a href="job-single.html" class="btn btn-primary py-2">Apply Job</a> -->
<!-- 		              </div> -->
<!-- 		            </div> -->
<!-- 		          </div>end -->

<!-- 		          <div class="col-md-12 ftco-animate"> -->
<!-- 		            <div class="job-post-item py-4 d-block d-lg-flex align-items-center"> -->
<!-- 		              <div class="one-third mb-4 mb-md-0"> -->
<!-- 		                <div class="job-post-item-header d-flex align-items-center"> -->
<!-- 		                  <h2 class="mr-3 text-black"><a href="#">Open Source Interactive Developer</a></h2> -->
<!-- 		                  <div class="badge-wrap"> -->
<!-- 		                   <span class="bg-danger text-white badge py-2 px-3">Temporary</span> -->
<!-- 		                  </div> -->
<!-- 		                </div> -->
<!-- 		                <div class="job-post-item-body d-block d-md-flex"> -->
<!-- 		                  <div class="mr-3"><span class="icon-layers"></span> <a href="#">New York Times</a></div> -->
<!-- 		                  <div><span class="icon-my_location"></span> <span>Western City, UK</span></div> -->
<!-- 		                </div> -->
<!-- 		              </div> -->

<!-- 		              <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0"> -->
<!-- 		              	<div> -->
<!-- 			                <a href="#" class="icon text-center d-flex justify-content-center align-items-center icon mr-2"> -->
<!-- 			                	<span class="icon-heart"></span> -->
<!-- 			                </a> -->
<!-- 		                </div> -->
<!-- 		                <a href="job-single.html" class="btn btn-primary py-2">Apply Job</a> -->
<!-- 		              </div> -->
<!-- 		            </div> -->
<!-- 		          </div>end -->
<!-- 		        </div> -->
<!-- 		      </div> -->
<!-- 		      <div class="col-lg-3 sidebar"> -->
<!-- 		        <div class="row justify-content-center pb-3"> -->
<!-- 		          <div class="col-md-12 heading-section ftco-animate"> -->
<!-- 		          	<span class="subheading">Recruitment agencies</span> -->
<!-- 		            <h2 class="mb-4">Top Recruitments</h2> -->
<!-- 		          </div> -->
<!-- 		        </div> -->


		        
			<div class="col-lg-3 sidebar">
		        <div class="row justify-content-center pb-3">
		          <div class="col-md-12 heading-section ftco-animate">
		          	      	<img class="one-third align-self-end order-md-last img-fluid" src="myButtons/folderss.png" alt="">
		          
		          	<span class="subheading">  </span>
		          	<br><br>
		            <h2 class="mb-4">Vous Pouvez : </h2>
		          </div>
		        </div>
		        <div class="sidebar-box ftco-animate">
		        	<div class="border">
			        	<a href="#" class="company-wrap"></a>
			        	<div class="text p-3">
			        		<h4 align ="center"><a ><b><span style="color:#ff6448">Annuler votre demande</span> </b></a></h4>
			        	</div>
		        	</div>
		        </div>
		        <div class="sidebar-box ftco-animate">
		        	<div class="border">
			        	<a href="#" class="company-wrap"></a>
			        	<div class="text p-3">
			        		<h4 align ="center"><a ><b><span style="color:#6d64ff">Accéder à votre dossier</span> </b></a></h4>
			        	</div>
			        </div>
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