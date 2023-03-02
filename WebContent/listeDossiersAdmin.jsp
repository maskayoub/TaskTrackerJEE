<%@ page import="metier.employe" %>
<%
		employe emplo = (employe) session.getAttribute("loggedOnEmp");
		if (session.getAttribute("loggedOnEmp")==null || emplo.getEmail_emp().equals("admin@admin.ma")==false){
		response.sendRedirect("loginEmploye.jsp");
		}
	%>

<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="metier.employe" %>
<%@ page import="metier.dossier" %>
<%@ page import="metier.EmployeMetierImp" %>
<%@ page import="metier.Iemploye" %>
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
		<input type="hidden" id="custId" name="typeD" value="${path}">


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
                        <li  >
                            <a href="sectionEmp.jsp">
                                <i class="fas fa-users"></i>Employés</a>
                        </li>
                        <li class="active has-sub">
                            <a href="sectionDossiers.jsp">
                                <i class="fas fa-folder"></i>Dossiers</a>
                        </li>
                        <li>
                            <a href="sectionTaches.jsp">
                                <i class="far fa-check-square"></i>Taches</a>
                        </li>
                        <li>
                            <a href="MessagesClients.php">
                                <i class="fas fa-envelope"></i>Messages</a>
                        </li>
                        
                        <li class="has-sub">
                        
                            <a class="js-arrow" >
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
                                    <h2 class="title-1">${before}Dossiers ${type}:</h2>
                                                                        
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
                            <br> <br> <br>
                            <c:if test="${detail}">
                            
                            <div class="col-4">
							    <div class="list-group" id="list-tab" role="tablist">
							    <% int i=1;%>
							    <c:forEach items = "${taches}" var = "r" varStatus="stat">
							    <c:if test="${stat.first}">
									 <a class="list-group-item list-group-item-action active" id="list-<%=i%>-list" data-toggle="list" href="#list-<%=i%>" role="tab" aria-controls="<%=i%>">Employe #<%=i%></a>
							     </c:if> 
							     <c:if test="${!stat.first}">
							      <a class="list-group-item list-group-item-action" id="list-<%=i%>-list" data-toggle="list" href="#list-<%=i%>" role="tab" aria-controls="<%=i%>">Employe #<%=i%></a>
							   	</c:if> 
							    <% i++;%>
							    </c:forEach>
							    </div>
							  </div>
							  <div class="col-8">
							    <div class="tab-content" id="nav-tabContent">
<!-- 							      <div class="tab-pane fade" id="list-home" role="tabpanel" aria-labelledby="list-home-list">Le traitement de votre dossier va commencer bientôt. Vous pouvez suivre la progression de votre dossier sur notre site Web en utilisant ce numéro: # -->
<!-- 							      </div> -->
<!-- 							      <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">Le traitement de votre dossier va commencer bientôt. Vous pouvez suivre la progression de votre dossier sur notre site Web en utilisant ce numéro: # -->
<!-- 							      </div> -->
<!-- 							      <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">Le traitement de votre dossier va commencer bientôt. Vous pouvez suivre la progression de votre dossier sur notre site Web en utilisant ce numéro: # -->
<!-- 							      </div> -->
									<%i=1;%>
							      <c:forEach items = "${taches}" var = "r" varStatus="stat">
							      <c:if test="${stat.first}">
							      <div class="tab-pane fade show active" id="list-<%=i%>" role="tabpanel" aria-labelledby="list-<%=i%>-list">
							      <% i++;%>
							      <div class="au-card au-card--bg-blue au-card-top-countries m-b-30">
                                    <div class="au-card-inner">
                                        <div class="table-responsive">
                                            <table class="table table-top-countries">
                                                <tbody>
                                                    <tr>
                                                        <td>Employé</td>
                                                        <td class="text-right">${dt[stat.index].nameEmp}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Nom Tache</td>
                                                        <td class="text-right">${r.nom_tache}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Temps</td>
                                                        <td class="text-right">${dt[stat.index].duree}</td>
                                                    </tr>
                                                
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            
                                </c:if>
                              <c:if test="${!stat.first}"> 
							      <div class="tab-pane fade" id="list-<%=i%>" role="tabpanel" aria-labelledby="list-<%=i%>-list">
									<% i++;%>
							      <div class="au-card au-card--bg-blue au-card-top-countries m-b-30">
                                    <div class="au-card-inner">
                                        <div class="table-responsive">
                                            <table class="table table-top-countries">
                                                <tbody>
                                                    <tr>
                                                        <td>Employé</td>
                                                        <td class="text-right">${dt[stat.index].nameEmp}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Nom Tache</td>
                                                        <td class="text-right">${r.nom_tache}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Temps</td>
                                                        <td class="text-right">${dt[stat.index].duree}</td>
                                                    </tr>
                                                
                                                   
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                </div>
                                </c:if>
<%--                                 <c:if test="${stat.last}"> --%>
<!--                                 <div class="card"> -->
<!-- 								  <div class="card-body"> -->
<%-- 								    <b>Numéro De Suivie: </b>${r.tracking_number} --%>
<!-- 								  </div> -->
<!-- 								</div> -->
                                
<%--                                 </c:if> --%>
							</c:forEach>
                    </div>
		        </div>
		        <br><br>			<br><br>	<br><br>	<br><br>	<br>
			 </c:if>				      
							      
	   			 <c:if test="${vide}">                                                  
							<div class="col-md-12"> 
						 		<div class="au-card au-card--bg-blue au-card-top-countries m-b-30" >
                                    <div class="au-card-inner" >
                                  <div align = "center">  <img src="myButtons/no-results.png" width="180" height="180" /></div>
                                         <h1 style ="color:white" align = "center" >Aucune Tache</h1>
                                    </div>
                                    <br>    
                                </div>	
                                
							</div>	     	     
							<br><br>			<br><br>	<br><br>	     
 					</c:if>		
                      
                        
                        <h3 class="title-5 m-b-35">Dossiers:</h3>
                             
                            
                            <div class="table-responsive table-responsive-data2">
                                <table class="table table-data2">
                                    <thead>
                                        <tr>
                                            	<th></th>
												<th>N#</th>
												<th>Nom</th>
												<th>Employé Actuel</th>
												<th>Date Ajout</th>
												<th>Etat</th>
												<th>Progression</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items = "${modd.dossier}" var = "r">
                                    <tr class="tr-shadow">
                                            <td>
                                       		     <a class="btn btn-primary" href="${path}?action=detDoss&ref1=${r.num_doss}" role="button">Détails</a>
                                            </td>
                                            <td><c:out  value="${r.num_doss}" /></td>
                                            <td>
                                                <span class="block-email"><c:out  value="${r.nom_doss}" /></span>
                                            </td>
                                            <td class="desc"><c:out value="${r.empl_courant.nom_emp} ${r.empl_courant.prenom_emp}" /></td>
                                            <td>
                                                <span> <c:out value="${r.date_ajout}" /></span>
                                            </td>
                                            <td><span class="status--denied"><c:out value="${r.etat_doss}" /></span></td>
                                            <td><span class="status--process"><c:out value="${r.progression_doss}%" /></span></td>
                                            <td>
                                                <div class="table-data-feature">
<%--                                                    <a href="controleur.php?action=accessDossier&ref1=${r.num_doss}&ref2=${r.empl_courant.num_emp}"><button class="item" data-toggle="tooltip" data-placement="top" title="Accéder" > --%>
<!--                                                         <i class="zmdi zmdi-mail-send"></i> -->
<!--                                                     </button></a> -->
<%--                                                    <a  href="controleur.php?action=beginWork&ref1=${r.empl_courant.num_emp}&ref2=${r.etat_doss}&ref3=${r.num_doss}"><button class="item" data-toggle="tooltip" data-placement="top" title="Commencer"> --%>
<!--                                                         <i class="zmdi zmdi-edit"></i> -->
<!--                                                     </button></a>  -->
									          <c:if test="${!primary}">
													<c:if test="${r.etat_doss != 'Echec De Traitement'}">
														<c:if test="${r.progression_doss == 100}"><td data-toggle="tooltip" data-placement="top" title="Dossier Traité"><img src="myButtons/fertigen.png" width="40" height="40"/></td></c:if>
                                                		<c:if test="${r.progression_doss lt 100}"><td data-toggle="tooltip" data-placement="top" title="Dossier En Cours De Traitement"><img src="myButtons/5e2b6e315f618.png" width="60" height="60"/></td></c:if>
                                                	</c:if>
                                                	<c:if test="${r.etat_doss == 'Echec De Traitement'}">
                                                		<td data-toggle="tooltip" data-placement="top" title="Échec Traitement"><img src="myButtons/failed.png" width="90" height="90"/></td>
                                                		<td data-toggle="tooltip" data-placement="top" title="Dossier Archivé"><img src="myButtons/archived.png" width="100" height="100"/></td>
                                                	</c:if>
                                               </c:if>
                                               <c:if test="${primary}">
                                                 <td data-toggle="tooltip" data-placement="top" title="Modifier"><a href="controleur.php?action=laModifier&ref1=${r.num_doss}"><img src="myButtons/edit-icon-png-0.png" width="80" height="80"/></a></td>
                                                 <td data-toggle="tooltip" data-placement="top" title="Supprimer"><a href="TousLesDossiers.php?action=laSupprimer&ref1=${r.num_doss}"><img src="myButtons/icon-delete-16.jpg" width="90" height="90"/></a></td>
                                               </c:if>
                                                 </div>
                                            </td>
                                        </tr>
                                      
                                        <tr class="spacer"></tr>
                                        
                                        </c:forEach>
                                    </tbody>
                                </table>
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