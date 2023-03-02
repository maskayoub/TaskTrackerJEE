<%@ page import="metier.employe" %>
<%
		employe emplo = (employe) session.getAttribute("loggedOnEmp");
		if (session.getAttribute("loggedOnEmp")==null || emplo.getEmail_emp().equals("admin@admin.ma")==false){
		response.sendRedirect("loginEmploye.jsp");
		}
	%>

<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<br>
<br>
<b><h1><span class="blue"></span><span class="blue"></span> <span class="yellow">Liste De Dossiers</pan></h1></b>
<h2><a href="adminDashboard.jsp" >Retour</a></h2>

<link href="table.css" rel="stylesheet" media="all">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>




<table class="container">
	<thead>
		<tr>
			<th><h1 >N#</h1></th>
			<th><h1>Nom</h1></th>
			<th><h1>Employé Actuel</h1></th>
			<th><h1>Date Ajout</h1></th>
			<th><h1>Etat</h1></th>
			<th><h1>Progression</h1></th>
			<th><h1>Employé</h1></th>


			
		</tr>
	</thead>
	<tbody>
	<c:forEach items = "${modd.dossier}" var = "r">
	<tr>
        <td >
            <c:out  value="${r.num_doss}" />
        </td>
        <td>
            <c:out value="${r.nom_doss}" />
        </td>
        <td>
            <c:out value="${r.empl_courant.nom_emp} ${r.empl_courant.prenom_emp}" />
        </td>
        <td>
            <c:out value="${r.date_ajout}" />
        </td>
        <td>
            <c:out value="${r.etat_doss}" />
        </td>
        <td>
            <c:out value="${r.progression_doss}%" />
        </td>
        <td>
            <c:out value="${r.nbre_emp}" />
        </td>
        <td>
               <a href="controleur.php?action=laModifier&ref1=${r.num_doss}"><img src="myButtons/edit-icon-png-0.png" width="30" height="30"  /></a>
        </td>
        <td>
               <a href="controleur.php?action=laSupprimer&ref1=${r.num_doss}"><img src="myButtons/icon-delete-16.jpg" width="30" height="30"  /></a>
        </td>
    </tr>
    </c:forEach>
	</tbody>
</table>

