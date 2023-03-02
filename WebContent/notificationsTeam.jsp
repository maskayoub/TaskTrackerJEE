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
                                <a href="notifsEmp.php">
                                    <i class="fas fa-bell"></i>
                                    <span class="bot-line"></span>Notifications</a>
                            </li>
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
                                    <span class="au-breadcrumb-span">Vous etes ici:</span>
                                    <ul class="list-unstyled list-inline au-breadcrumb__list">
                                        <li class="list-inline-item active">
                                            <a href="platformeEmploye.php">Accueil</a>
                                        </li>
                                        <li class="list-inline-item seprate">
                                            <span>/</span>
                                        </li>
                                        <li class="list-inline-item">Notifications</li>
                                    </ul>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END BREADCRUMB-->

           
            

            <!-- DATA TABLE-->
            <section class="p-t-20">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            
<!--                             <div class="table-responsive table-responsive-data2"> -->
<!--                                 <table class="table table-data2"> -->
<!--                                     <thead> -->
<!--                                         <tr> -->
<!--                                             <th> -->
<!--                                                 <label class="au-checkbox"> -->
<!--                                                     <input type="checkbox"> -->
<!--                                                     <span class="au-checkmark"></span> -->
<!--                                                 </label> -->
<!--                                             </th> -->
<!-- 												<th>N#</th> -->
<!-- 												<th>Nom</th> -->
<!-- 												<th>Employé Actuel</th> -->
<!-- 												<th>Date Ajout</th> -->
<!-- 												<th>Etat</th> -->
<!-- 												<th>Progression</th> -->
<!--                                             <th></th> -->
<!--                                         </tr> -->
<!--                                     </thead> -->
<!--                                     <tbody> -->
<%--                                     <c:forEach items = "${modd.dossier}" var = "r"> --%>
<!--                                     <tr class="tr-shadow"> -->
<!--                                             <td> -->
<!--                                                 <label class="au-checkbox"> -->
<!--                                                     <input type="checkbox"> -->
<!--                                                     <span class="au-checkmark"></span> -->
<!--                                                 </label> -->
<!--                                             </td> -->
<%--                                             <td><c:out  value="${r.num_doss}" /></td> --%>
<!--                                             <td> -->
<%--                                                 <span class="block-email"><c:out  value="${r.nom_doss}" /></span> --%>
<!--                                             </td> -->
<%--                                             <td class="desc"><c:out value="${r.empl_courant.nom_emp} ${r.empl_courant.prenom_emp}" /></td> --%>
<!--                                             <td> -->
<%--                                                 <span> <c:out value="${r.date_ajout}" /></span> --%>
<!--                                             </td> -->
<%--                                             <td><span class="status--denied"><c:out value="${r.etat_doss}" /></span></td> --%>
<%--                                             <td><span class="status--process"><c:out value="${r.progression_doss}%" /></span></td> --%>
<!--                                             <td> -->
<!--                                                 <div class="table-data-feature"> -->
<%-- <%--                                                    <a href="controleur.php?action=accessDossier&ref1=${r.num_doss}&ref2=${r.empl_courant.num_emp}"><button class="item" data-toggle="tooltip" data-placement="top" title="Accéder" > --%>
<!-- <!--                                                         <i class="zmdi zmdi-mail-send"></i> --> 
<!-- <!--                                                     </button></a> -->
<%-- <%--                                                    <a  href="controleur.php?action=beginWork&ref1=${r.empl_courant.num_emp}&ref2=${r.etat_doss}&ref3=${r.num_doss}"><button class="item" data-toggle="tooltip" data-placement="top" title="Commencer"> --%>
<!-- <!--                                                         <i class="zmdi zmdi-edit"></i> -->
<!-- <!--                                                     </button></a>  -->
<%-- 													<c:if test="${r.etat_doss != 'Echec De Traitement'}"> --%>
<%-- 														<c:if test="${r.progression_doss lt 100}"><c:if test="${r.state}"><td data-toggle="tooltip" data-placement="left" title="Confirmer Fin"><a href="controleur.php?action=accessDossier&ref1=${r.num_doss}&ref2=${r.empl_courant.num_emp}"><img src="myButtons/next.png" width="40" height="40"/></a></td></c:if><c:if test="${!r.state}"><td data-toggle="tooltip" data-placement="left" title="Confirmer Début"><a  href="controleur.php?action=beginWork&ref1=${r.empl_courant.num_emp}&ref2=${r.etat_doss}&ref3=${r.num_doss}"><img src="myButtons/begin.png" width="40" height="40"  /></a></td></c:if> </c:if> --%>
<%-- 														<c:if test="${r.progression_doss == 100}"><td data-toggle="tooltip" data-placement="left" title="Dossier Traité"><img src="myButtons/fertigen.png" width="40" height="40"/></td></c:if> --%>
<%-- 															<c:if test="${r.etat_doss != 'Attente'}"><td data-toggle="tooltip" data-placement="right" title="Confirmer Échec"><a href="echec.php?action=markFail&ref1=${r.num_doss}&ref2=${r.tache_courante.num_tache}"><img src="myButtons/issue.png" width="50" height="50"/></a></td></c:if> --%>
<%--                                                 	</c:if> --%>
<%--                                                 	<c:if test="${r.etat_doss == 'Echec De Traitement'}"> --%>
<!--                                                 		<td data-toggle="tooltip" data-placement="left" title="Échec Traitement"><img src="myButtons/failed.png" width="40" height="40"/></td> -->
<!--                                                 		<td data-toggle="tooltip" data-placement="right" title="Dossier Archivé"><img src="myButtons/archived.png" width="50" height="50"/></td> -->
<%--                                                 	</c:if> --%>
<!--                                                  </div> -->
<!--                                             </td> -->
<!--                                         </tr> -->
                                      
<!--                                         <tr class="spacer"></tr> -->
                                        
<%--                                         </c:forEach> --%>
<!--                                     </tbody> -->
<!--                                 </table> -->
<!--                             </div> -->

								  <div align="center">
                            <div class="col-lg-6">
                                <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
                                    <div class="au-card-title" style="background-image:url('images/bg-title-01.jpg');">
                                        <div class="bg-overlay bg-overlay--blue"></div>
                                        <h3>
                                            <i class="zmdi zmdi-notifications-active"></i>Notifications</h3>
                                        <button class="au-btn-plus">
                                            <i class="zmdi zmdi-refresh"></i>
                                        </button>
                                    </div>
                                    <div class="au-task js-list-load">
                                        <div class="au-task__title">
                                            <div class="au-chat-textfield">
                                                <form class="au-form-icon">
                                                    <input class="au-input au-input--full au-input--h65" type="text" placeholder="Écrire un message...">
                                                    <button class="au-input-icon">
                                                        <i class="zmdi zmdi zmdi-mail-send"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="au-task-list js-scrollbar3">
                                            <div class="au-task__item au-task__item--danger">
                                                <div class="au-task__item-inner">
                                                    <h5 class="task">
                                                        <a href="#">Meeting about plan for Admin Template 2018</a>
                                                    </h5>
                                                    <span class="time">10:00 AM</span>
                                                </div>
                                            </div>
                                            <div class="au-task__item au-task__item--warning">
                                                <div class="au-task__item-inner">
                                                    <h5 class="task">
                                                        <a href="#">Create new task for Dashboard</a>
                                                    </h5>
                                                    <span class="time">11:00 AM</span>
                                                </div>
                                            </div>
                                            <div class="au-task__item au-task__item--primary">
                                                <div class="au-task__item-inner">
                                                    <h5 class="task">
                                                        <a href="#">Meeting about plan for Admin Template 2018</a>
                                                    </h5>
                                                    <span class="time">02:00 PM</span>
                                                </div>
                                            </div>
                                            <div class="au-task__item au-task__item--success">
                                                <div class="au-task__item-inner">
                                                    <h5 class="task">
                                                        <a href="#">Create new task for Dashboard</a>
                                                    </h5>
                                                    <span class="time">03:30 PM</span>
                                                </div>
                                            </div>
                                            <div class="au-task__item au-task__item--danger js-load-item">
                                                <div class="au-task__item-inner">
                                                    <h5 class="task">
                                                        <a href="#">Meeting about plan for Admin Template 2018</a>
                                                    </h5>
                                                    <span class="time">10:00 AM</span>
                                                </div>
                                            </div>
                                            <div class="au-task__item au-task__item--warning js-load-item">
                                                <div class="au-task__item-inner">
                                                    <h5 class="task">
                                                        <a href="#">Create new task for Dashboard</a>
                                                    </h5>
                                                    <span class="time">11:00 AM</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="au-task__footer">
                                            <button class="au-btn au-btn-load js-load-btn">load more</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
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