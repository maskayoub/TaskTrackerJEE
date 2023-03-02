<%@ page import="metier.employe" %>
<%
		employe emplo = (employe) session.getAttribute("loggedOnEmp");
		if (session.getAttribute("loggedOnEmp")==null || emplo.getEmail_emp().equals("admin@admin.ma")==false){
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
    <title>Dashboard Admin</title>

    <!-- Fontfaces CSS-->
    <link href="css/font-face.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
	<link href="css/align-buttons.css" rel="stylesheet" media="all">

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
    <link href="progressBar.css" rel="stylesheet" media="all">
    

    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all">

</head>



        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="adminDashboard.jsp">
                    <img src="images/icon/logoA.png" alt="Cool Admin" />
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li>
                            <a href="adminDashboard.jsp">
                                <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                         
                        </li>
                        <li >
                            <a href="sectionEmp.jsp">
                                <i class="fas fa-users"></i>Employés</a>
                        </li>
                        <li>
                            <a href="sectionDossiers.jsp">
                                <i class="fas fa-folder"></i>Dossiers</a>
                        </li>
                        <li class="active has-sub">
                            <a >
                                <i class="far fa-check-square"></i>Taches</a>
                        </li>
                        <li>
                            <a href="MessagesClients.php">
                                <i class="fas fa-envelope"></i>Messages</a>
                        </li>
                        
                        <li class="has-sub">
                        
                            <a class="js-arrow">
                                <a href="indexClient.jsp"><i class="fas fa-desktop"></i>Platforme Client</a></a>
                          	<form action = "controleur.php" method = post>
                                <a href="employe.php?action=platEmp"><i class="fas fa-desktop"></i>Platforme Employé</a>
                            </form> 	
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <form class="form-header" action="" method="POST">
                               
                            </form>
                            <div class="header-button">
                                <div class="noti-wrap">
                                   
                                    
                                    
                                </div>
                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                                        <div class="image">
                                            <img src="images/icon/avatar-01.jpg" alt="Admin" />
                                        </div>
                                        <div class="content">
                                            <a class="js-acc-btn" href="#">Admin</a>
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
                                                        <a href="#">Admin</a>
                                                    </h5>
                                                    <span class="email">admin@admin.ma</span>
                                                </div>
                                            </div>
                                            <div class="account-dropdown__body">
                                                <div class="account-dropdown__item">
                                                    <a href="#">
                                                        <i class="zmdi zmdi-account"></i>Account</a>
                                                </div>
                                                
                                                
                                            </div>
                                            <div class="account-dropdown__footer">
                                                <a href="logout.php?action=logout">
                                                    <i class="zmdi zmdi-power"></i>Déconnexion</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">Choisissez une option:</h2>
                                                                        
<!--                                <form action="ajoutDossier.jsp"> -->
<!--                                           <button class="au-btn au-btn-icon au-btn--blue"> -->
<!--                                 </form> -->
<!--                                    <i class="zmdi zmdi-plus"></i>Ajouter Dossier</button> -->
<!--                                    <form action = "controleur.php" method = post> -->
<!--                                           <button class="au-btn au-btn-icon au-btn--blue" type = "submit" name = "action"  value = "modifier"> -->
<!--                                 </form> -->
<!--                                    </i>Modifier Dossier</button> -->
                                </div>
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="row">
                        	<div  class="column">
                        	<form action = "ajouter.php" method = post>
                        		<button  type = "submit" name = "action"  value = "addtache"><img src="myButtons/newtask.png" width="250" height="250"  /></button>
                        	</form>	
                           	</div>
                        	<div class="column">
                        	<form action = "controleur.php" method = post>
                        			<button type = "submit" name = "action"  value = "listTasks"><img src="myButtons/listtasks.png" width="250" height="250"  /></button>
                        	</form>
                        	</div>
                        	
                        	<div class="column">
                        	<form action = "ListeSuggestions.php" method = post>
                        			<button type = "submit" name = "action"  value = "listSuggestions"><img src="myButtons/suggestion_tache.png" width="240" height="240"  /></button>
                        	</form>
                        	</div>
                        	
                        	
                        	
                        
                        </div>
                        
                        <br>
                        <br>
                      
                        
                        <br><br><br>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
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