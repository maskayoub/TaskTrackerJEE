<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="metier.employe" %>
<%
		if (session.getAttribute("loggedOnEmp")==null){
		response.sendRedirect("loginEmploye.jsp");
		}
	%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Employé Dashboard</title>

    <!-- Fontfaces CSS-->
    <link href="css/font-face.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all">

</head>

<body class="animsition">
    <div class="page-wrapper">
        <!-- HEADER DESKTOP-->
        <header class="header-desktop3 d-none d-lg-block">
            <div class="section__content section__content--p35">
                <div class="header3-wrap">
                    <div class="header__logo">
                        <a href="#">
                            <img src="images/icon/logo-whiteL.png" alt="CoolAdmin" />
                        </a>
                    </div>
                    <div class="header__navbar">
                        <ul class="list-unstyled">
                            <li class="has-sub">
                                <a href="platformeEmploye.php">
                                    <i class="fas fa-tachometer-alt"></i>Dashboard
                                    <span class="bot-line"></span>
                                </a>
                            </li>
                            <li>
                                <a href="DossiersAchives.php">
                                    <i class="fas fa-folder"></i>
                                    <span class="bot-line"></span>Dossiers Archivées</a>
                            </li>
<!--                             <li> -->
<!--                                 <a href="#"> -->
<!--                                     <i class="fas fa-shopping-basket"></i> -->
<!--                                     <span class="bot-line"></span>eCommerce</a> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <a href="table.html"> -->
<!--                                     <i class="fas fa-trophy"></i> -->
<!--                                     <span class="bot-line"></span>Features</a> -->
<!--                             </li> -->
<!--                             <li class="has-sub"> -->
<!--                                 <a href="#"> -->
<!--                                     <i class="fas fa-copy"></i> -->
<!--                                     <span class="bot-line"></span>Pages</a> -->
<!--                                 <ul class="header3-sub-list list-unstyled"> -->
<!--                                     <li> -->
<!--                                         <a href="login.html">Login</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="register.html">Register</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="forget-pass.html">Forget Password</a> -->
<!--                                     </li> -->
<!--                                 </ul> -->
<!--                             </li> -->
<!--                             <li class="has-sub"> -->
<!--                                 <a href="#"> -->
<!--                                     <i class="fas fa-desktop"></i> -->
<!--                                     <span class="bot-line"></span>UI Elements</a> -->
<!--                                 <ul class="header3-sub-list list-unstyled"> -->
<!--                                     <li> -->
<!--                                         <a href="button.html">Button</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="badge.html">Badges</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="tab.html">Tabs</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="card.html">Cards</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="alert.html">Alerts</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="progress-bar.html">Progress Bars</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="modal.html">Modals</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="switch.html">Switchs</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="grid.html">Grids</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="fontawesome.html">FontAwesome</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="typo.html">Typography</a> -->
<!--                                     </li> -->
<!--                                 </ul> -->
<!--                             </li> -->
                        </ul>
                    </div>
                    <%
                     employe emplo = (employe) session.getAttribute("loggedOnEmp");
	           		 String sessus = emplo.getPrenom_emp() + " " + emplo.getNom_emp();
	           		 String emailus = emplo.getEmail_emp();
	           		int num = emplo.getNum_emp();
	           		String nom = emplo.getNom_emp();
	           		String prenom = emplo.getPrenom_emp();
	           		String addemp = emplo.getAdd_emp();
	           		String tel = emplo.getTel_emp();
	           		String email = emplo.getEmail_emp();
	           		String mdp = emplo.getMdp_emp();
	           		String cin = emplo.getCin_emp();
	           		String datenaiss = emplo.getDatenai_emp();
                    %>
                    <div class="header__tool">
                        
                        
                        <div class="account-wrap">
                            <div class="account-item account-item--style2 clearfix js-item-menu">
                                <div class="image">
                                    <img src="images/icon/avatar-02.jpg" alt="John Doe" />
                                </div>
                                <div class="content">
                                    <a class="js-acc-btn" href="#"><%=sessus%></a> 
                                </div>
                                <div class="account-dropdown js-dropdown">
                                    <div class="info clearfix">
                                        <div class="image">
                                            <a href="#">
                                                <img src="images/icon/avatar-02.jpg" alt="John Doe" />
                                            </a>
                                        </div>
                                        <div class="content">
                                            <h5 class="name">
                                                <a href="#"><%=sessus%></a>
                                            </h5>
                                            <span class="email"><%=emailus%></span>
                                        </div>
                                    </div>
                                    <div class="account-dropdown__body">
                                        <div class="account-dropdown__item">
                                            <a href="#">
                                                <i class="zmdi zmdi-account"></i>Compte</a>
                                        </div>
                                        
                                           </div>
                                    <div class="account-dropdown__footer">
                                        <form action = "logout.php" method = post>
                                         <a href="logout.php?action=logout"><i class="zmdi zmdi-power"></i>Déconnexion</a>
                                         </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- END HEADER DESKTOP-->

        <div class="sub-header-mobile-2 d-block d-lg-none">
            <div class="header__tool">
                <div class="header-button-item has-noti js-item-menu">
                    <i class="zmdi zmdi-notifications"></i>
                    <div class="notifi-dropdown notifi-dropdown--no-bor js-dropdown">
                        <div class="notifi__title">
                            <p>You have 3 Notifications</p>
                        </div>
                        <div class="notifi__item">
                            <div class="bg-c1 img-cir img-40">
                                <i class="zmdi zmdi-email-open"></i>
                            </div>
                            <div class="content">
                                <p>You got a email notification</p>
                                <span class="date">April 12, 2018 06:50</span>
                            </div>
                        </div>
                        <div class="notifi__item">
                            <div class="bg-c2 img-cir img-40">
                                <i class="zmdi zmdi-account-box"></i>
                            </div>
                            <div class="content">
                                <p>Your account has been blocked</p>
                                <span class="date">April 12, 2018 06:50</span>
                            </div>
                        </div>
                        <div class="notifi__item">
                            <div class="bg-c3 img-cir img-40">
                                <i class="zmdi zmdi-file-text"></i>
                            </div>
                            <div class="content">
                                <p>You got a new file</p>
                                <span class="date">April 12, 2018 06:50</span>
                            </div>
                        </div>
                        <div class="notifi__footer">
                            <a href="#">All notifications</a>
                        </div>
                    </div>
                </div>
                <div class="header-button-item js-item-menu">
                    <i class="zmdi zmdi-settings"></i>
                    <div class="setting-dropdown js-dropdown">
                        <div class="account-dropdown__body">
                            <div class="account-dropdown__item">
                                <a href="#">
                                    <i class="zmdi zmdi-account"></i>Account</a>
                            </div>
                            <div class="account-dropdown__item">
                                <a href="#">
                                    <i class="zmdi zmdi-settings"></i>Setting</a>
                            </div>
                            <div class="account-dropdown__item">
                                <a href="#">
                                    <i class="zmdi zmdi-money-box"></i>Billing</a>
                            </div>
                        </div>
                        <div class="account-dropdown__body">
                            <div class="account-dropdown__item">
                                <a href="#">
                                    <i class="zmdi zmdi-globe"></i>Language</a>
                            </div>
                            <div class="account-dropdown__item">
                                <a href="#">
                                    <i class="zmdi zmdi-pin"></i>Location</a>
                            </div>
                            <div class="account-dropdown__item">
                                <a href="#">
                                    <i class="zmdi zmdi-email"></i>Email</a>
                            </div>
                            <div class="account-dropdown__item">
                                <a href="#">
                                    <i class="zmdi zmdi-notifications"></i>Notifications</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="account-wrap">
                    <div class="account-item account-item--style2 clearfix js-item-menu">
                        <div class="image">
                            <img src="images/icon/avatar-01.jpg" alt="John Doe" />
                        </div>
                        <div class="content">
                            <a class="js-acc-btn" href="#">john doe</a>
                        </div>
                        <div class="account-dropdown js-dropdown">
                            <div class="info clearfix">
                                <div class="image">
                                    <a href="#">
                                        <img src="images/icon/avatar-01.jpg" alt="John Doe" />
                                    </a>
                                </div>
                                <div class="content">
                                    <h5 class="name">
                                        <a href="#">john doe</a>
                                    </h5>
                                    <span class="email">johndoe@example.com</span>
                                </div>
                            </div>
                            <div class="account-dropdown__body">
                                <div class="account-dropdown__item">
                                    <a href="#">
                                        <i class="zmdi zmdi-account"></i>Account</a>
                                </div>
                                <div class="account-dropdown__item">
                                    <a href="#">
                                        <i class="zmdi zmdi-settings"></i>Setting</a>
                                </div>
                                <div class="account-dropdown__item">
                                    <a href="#">
                                        <i class="zmdi zmdi-money-box"></i>Billing</a>
                                </div>
                            </div>
                            <div class="account-dropdown__footer">
                                <a href="#">
                                    <i class="zmdi zmdi-power"></i>Logout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END HEADER MOBILE -->

        <!-- PAGE CONTENT-->
        <div class="page-content--bgf7">
            <!-- BREADCRUMB-->
            <section class="au-breadcrumb2">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="au-breadcrumb-content">
                                <div class="au-breadcrumb-left">
                                    <span class="au-breadcrumb-span">Vous etes ici:</span>
                                    <ul class="list-unstyled list-inline au-breadcrumb__list">
                                        <li class="list-inline-item active">
                                            <a href="#">Home</a>
                                        </li>
                                        <li class="list-inline-item seprate">
                                            <span>/</span>
                                        </li>
                                        <li class="list-inline-item">Dashboard</li>
                                    </ul>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END BREADCRUMB-->

            <!-- WELCOME-->
            <section class="welcome p-t-10">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="title-4">Votre Compte
                                <span>Mr. <%=sessus%>!</span>
                            </h1>
                            <hr class="line-seprate">
                        </div>
                    </div>
                </div>
            </section>
            <!-- END WELCOME-->

            

            <!-- DATA TABLE-->
            <section class="p-t-20">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="title-5 m-b-35">Vos Infos:</h3>
                            
                           <form class="needs-validation" action = "ModifierProfil.php" method = post>
  <div class="form-row">
  <div class="col-md-4 mb-3">
      <label for="validationCustom01">N#</label>
      <input type="number" class="form-control" id="validationCustom01" name="numemp" value="<%=num%>" readonly>
      <div class="valid-feedback">
        Parfait!
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationCustom01">Prénom</label>
      <input type="text" class="form-control" id="validationCustom01" name="prenom" value="<%=prenom%>" readonly>
      <div class="valid-feedback">
        Parfait!
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationCustom02">Nom</label>
      <input type="text" class="form-control" id="validationCustom02" name="nom" value="<%=nom%>" readonly>
      <div class="valid-feedback">
        Parfait!
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationCustomUsername">E-Mail</label>
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">@</span>
        </div>
        <input type="text" class="form-control" id="validationCustomUsername" name="email" aria-describedby="inputGroupPrepend" value="<%=email%>" required>
        <div class="invalid-feedback">
          Veuillez saisir un E-Mail.
        </div>
      </div>
    </div>
  </div>
  <div class="form-row">
    <div class="col-md-6 mb-3">
      <label for="validationCustom03">Adresse</label>
      <input type="text" class="form-control" id="validationCustom03" name="addemp"  value="<%=addemp%>" required>
      <div class="invalid-feedback">
        Veuillez saisir une adresse.
      </div>
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationCustom04">GSM</label>
      <input type="number" class="form-control" id="validationCustom04" name="gsm" value="<%=tel%>" required>
      <div class="invalid-feedback">
        Veuillez saisir un numéro de téléphone.
      </div>
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationCustom05">Mot De Passe</label>
      <input type="password" class="form-control" id="validationCustom05" name="mdp" value="<%=mdp%>" required>
      <div class="invalid-feedback">
        Veuillez saisir un mot de passe.
      </div>
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationCustom05">CIN</label>
      <input type="text" class="form-control" id="validationCustom05" name="cin" value="<%=cin%>" readonly>
      <div class="invalid-feedback">
        Veuillez saisir votre CIN.
      </div>
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationCustom05">Date De Naissance</label>
      <input type="date" class="form-control" id="validationCustom05" name="datenaiss" value="<%=datenaiss%>" readonly>
      <div class="invalid-feedback">
        Veuillez saisir votre date de naissance.
      </div>
    </div>
  </div>
  <div class="form-group">
    
  </div>
  <button class="btn btn-primary" type = "submit" name = "action"  value = "modCordEmp">Confirmer Les Changements</button>
</form>
                           
                        </div>
                    </div>
                </div>
            </section>
            <!-- END DATA TABLE-->

            <!-- COPYRIGHT-->
            <section class="p-t-60 p-b-20">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="copyright">
                                <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END COPYRIGHT-->
        </div>

    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="vendor/slick/slick.min.js">
    </script>
    <script src="vendor/wow/wow.min.js"></script>
    <script src="vendor/animsition/animsition.min.js"></script>
    <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="vendor/circle-progress/circle-progress.min.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="js/main.js"></script>

	<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>
</body>

</html>
<!-- end document-->