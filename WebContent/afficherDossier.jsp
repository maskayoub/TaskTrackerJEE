<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
    <%
		if (session.getAttribute("loggedOnEmp")==null){
		response.sendRedirect("loginEmploye.jsp");
		}
	%>
<!DOCTYPE html>
<html>
<head>
<link href="dossierDisplay.css" rel="stylesheet" media="all">
<link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script >
$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').trigger('focus')
	})
	
	// Material Select Initialization
$(document).ready(function() {
$('.mdb-select').materialSelect();
});
</script>
<title>Consulter Dossier</title>
</head>
<body>

<div class="background">
  <div class="container">
    <div class="panel pricing-table">
      
      <div class="pricing-plan">
        <img src="https://s22.postimg.cc/8mv5gn7w1/paper-plane.png" alt="" class="pricing-img">
        <h2 class="pricing-header">Dossier</h2>
        <ul class="pricing-features">
          <li class="pricing-features-item">N# ${folder.num_doss}</li>
          <li class="pricing-features-item">${folder.nom_doss}</li>
          <li class="pricing-features-item">${folder.date_ajout}</li>
        </ul>
      </div>
      
      <div class="pricing-plan">
        <img src="https://s28.postimg.cc/ju5bnc3x9/plane.png" alt="" class="pricing-img">
        <h2 class="pricing-header">Employés</h2>
        <ul class="pricing-features">
          <li class="pricing-features-item">${folder.nbre_emp} Employé(s)</li>
          <li class="pricing-features-item">${name}</li>
        </ul>
       <form action = "controleur.php" method = post>
        <div class="form-group">
			            <label>Numéro De Dossier:</label>
			            <input type="text" class="form-control" value="${folder.num_doss}" name="numfolder" readonly>
          			</div>
          			<div class="form-group">
			            <label>Numéro Employé:</label>
			            <input type="text" class="form-control" value="${folder.empl_courant.num_emp}" name="numempll" readonly>
          			</div>
         
       <div class="form-group">
         <label>Employé Suivant:</label>
			<select class="form-control"  name="empsuiv">
				<c:forEach items = "${modd.emp}" var = "r">
					<option value="${r.num_emp}" ><c:out value="${r.nom_emp} ${r.prenom_emp}" /></option>
			    </c:forEach>		
			</select>
					</div>	
		<br>
        <button class="btn btn-primary" type = "submit" name = "action" value="confEnd">Confirmer Fin</button>
    </form>
      </div>
      
      <div class="pricing-plan">
        <img src="https://s21.postimg.cc/tpm0cge4n/space-ship.png" alt="" class="pricing-img">
        <h2 class="pricing-header">Progression</h2>
        <ul class="pricing-features">
          <li class="pricing-features-item">${folder.etat_doss}</li>
        </ul>
        <span class="pricing-price">${folder.progression_doss}%</span>
      </div>
      
    </div>
  </div>
</div>

       

<!-- <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!--   <div class="modal-dialog" role="document"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <h5 class="modal-title" id="exampleModalLabel">Confirmer Fin De Travail</h5> -->
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
<!--       </div> -->
     
<!--       <div class="modal-body"> -->
<!--         <form action = "controleur.php" method = post> -->
<!-- <!--           <div class="form-group"> --> -->
<!-- <!--             <label for="recipient-name" class="col-form-label">Employé Suivant:</label> --> -->
<!-- <!--             <input type="text" class="form-control" id="recipient-name"> --> -->
<!-- <!--           </div> --> -->
<!-- 				<h5>Employé Suivant:</h5> -->
<!-- 					<div> -->
<!-- 						<select class="col-form-label" name="empsuiv"> -->
<%-- 						<c:forEach items = "${modd.emp}" var = "r"> --%>
<%-- 							<option value="${r.num_emp}" ><c:out value="${r.nom_emp} ${r.prenom_emp}" /></option> --%>
<%-- 					    </c:forEach> --%>
							
<!-- 						</select> -->
<!-- 					</div>	 -->
<!-- 					<div> -->
<!-- 					<div class="form-group"> -->
<!-- 			            <label for="recipient-name" class="col-form-label">Numéro De Dossier:</label> -->
<!-- 			            <input type="text" class="form-control" value=${folder.num_doss} name="numfolder" readonly> -->
<!--           			</div> -->
					
<!-- 					</div> -->
          
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button> -->
<!--         <button type="button" class="btn btn-primary" type = "submit" name = "action" value="confEnd">Confirmer Fin</button> -->
<!--       </div> -->
<!--       </form> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->

</body>
</html>