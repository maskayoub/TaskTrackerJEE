<%@ page import="metier.employe" %>
<%
		if (session.getAttribute("loggedOnEmp")==null){
		response.sendRedirect("loginEmploye.jsp");
		}
	%>
    <%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<link href="dossierDisplay.css" rel="stylesheet" media="all">

<meta charset="ISO-8859-1">
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
        </ul>
        <span class="pricing-price">${folder.date_ajout}</span>
      </div>
      
      <div class="pricing-plan">
        <img src="https://s28.postimg.cc/ju5bnc3x9/plane.png" alt="" class="pricing-img">
        <h2 class="pricing-header">Employés</h2>
        <ul class="pricing-features">
          <li class="pricing-features-item">${folder.nbre_emp} Employé(s)</li>
          <li class="pricing-features-item">${folder.empl_courant.nom_emp folder.empl_courant.prenom_emp}</li>
        </ul>
        <a href="#/" class="pricing-button is-featured">Confirmer Fin</a>
      </div>
      
      <div class="pricing-plan">
        <img src="https://s21.postimg.cc/tpm0cge4n/space-ship.png" alt="" class="pricing-img">
        <h2 class="pricing-header">Progression</h2>
        <ul class="pricing-features">
          <li class="pricing-features-item">${folder.etat_doss}</li>
        </ul>
        <span class="pricing-price">${folder.progression_doss}</span>
        <a href="#/" class="pricing-button">Free trial</a>
      </div>
      
    </div>
  </div>
</div>

</body>
</html>