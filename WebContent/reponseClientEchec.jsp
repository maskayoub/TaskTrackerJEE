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
                                
<!--                                 <ul class="header3-sub-list list-unstyled"> -->
<!--                                     <li> -->
<!--                                         <a href="index.html">Dashboard 1</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="index2.html">Dashboard 2</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="index3.html">Dashboard 3</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="index4.html">Dashboard 4</a> -->
<!--                                     </li> -->
<!--                                 </ul> -->
                            </li>
                           
                            <li>
                                <a href="DossiersAchives.php">
                                    <i class="fas fa-folder"></i>
                                    <span class="bot-line"></span>Dossiers Archivées</a>
                            </li>
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
	           		String nom = emplo.getNom_emp();
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
                                            <a href="compteEmploye.jsp">
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
                                    <span class="au-breadcrumb-span">Vous étes ici:</span>
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
                            <h1 class="title-4">Bienvenue
                                <span>Mr. <%=nom%>!</span>
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
                            <h3 class="title-5 m-b-35">Répondre:</h3>
                            
                             <div class="row" >
                        	<div class="col-lg-6">
                                <div class="card" align="center">
                             <form action = "RaisonEchecDossier.php"  method="post"  >
                                    <div class="card-header">
                                        Raison De <strong>L'échec</strong>
                                    </div>
                                    <div class="card-body card-block">
                                           
                                           
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="email-input" class=" form-control-label">Email Client</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" name="emailc" value="${emailc}" readonly class="form-control">
                                                </div>
                                            </div>
                                             <input type="hidden"  name="numdoss" value="${numdoss}">

                                            
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">Sujet</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" name="sujrep" placeholder="Entrer Le Sujet Du Message" class="form-control">
                                                </div>
                                            </div>
                                            
                                            
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="textarea-input" class=" form-control-label">Message</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <textarea name="msgrep" placeholder="Votre message ici" id="msgrep" rows="9"  class="form-control">Bonjour, 

Malheureusement, votre demande n a pas pu être traitée car une erreur c est produite lors du traitement de votre dossier.

La raison derrière ceci est: 

  *Ajouter La Raison Ici*

Pour plus d'informations, prière de nous envoyer un message via la section contact de notre site web.

Task Tracker vous remercie.</textarea>
                                                </div>
                                            </div>
                                        
                                        
                                    </div>
                                     <div class="card-footer">
                                        <button type = "submit" name = "action"  value = "messageEchec" class="btn btn-primary btn-sm">
                                            <i class="fa fa-dot-circle-o"></i> Envoyer
                                        </button>
                                        
                                    </div>
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

</body>

</html>
<!-- end document-->