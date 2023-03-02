<%@ page import="metier.employe" %>
<%
		employe emplo = (employe) session.getAttribute("loggedOnEmp");
		if (session.getAttribute("loggedOnEmp")==null || emplo.getEmail_emp().equals("admin@admin.ma")==false){
		response.sendRedirect("loginEmploye.jsp");
		}
	%>

<!DOCTYPE html>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html lang="en">
<head>


	<title>Ajout Dossier</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="ContactFrom_v18/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ContactFrom_v18/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ContactFrom_v18/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ContactFrom_v18/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ContactFrom_v18/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ContactFrom_v18/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ContactFrom_v18/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ContactFrom_v18/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ContactFrom_v18/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ContactFrom_v18/css/util.css">
	<link rel="stylesheet" type="text/css" href="ContactFrom_v18/css/main.css">
<!--===============================================================================================-->
</head>
<body>


	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form validate-form" action = "ajouter.php" method = post>
				<span class="contact100-form-title">
					Ajouter Une T�che
				</span>


				<div class="wrap-input100 validate-input" data-validate="Required">
					<label class="label-input100" for="name">Nom T�che</label>
					<input id="nomDoss" class="input100" type="text" name="nomtache" placeholder="Entrer le nom de la t�che...">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100">
					<div class="label-input100">Responsable de T�che</div>
					<div>
						<select class="js-select2" name="emptache">
						<c:forEach items = "${modd.emp}" var = "r">
							<option value="${r.num_emp}" ><c:out value="${r.nom_emp} ${r.prenom_emp}" /></option>
					    </c:forEach>
							
						</select>
						<div class="dropDownSelect2"></div>
					</div>	
					<span class="focus-input100"></span>
				</div>
				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn" type = "submit" name = "action"  value = "ajoutertache">
						Ajouter
					</button>
				</div>

				
			</form>

			<div class="contact100-more flex-col-c-m" style="background-image: url('ContactFrom_v18/images/bg-01.jpg');">
			</div>
		</div>
	</div>





<!--===============================================================================================-->
	<script src="ContactFrom_v18/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="ContactFrom_v18/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="ContactFrom_v18/vendor/bootstrap/js/popper.js"></script>
	<script src="ContactFrom_v18/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="ContactFrom_v18/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
		$(".js-select2").each(function(){
			$(this).on('select2:open', function (e){
				$(this).parent().next().addClass('eff-focus-selection');
			});
		});
		$(".js-select2").each(function(){
			$(this).on('select2:close', function (e){
				$(this).parent().next().removeClass('eff-focus-selection');
			});
		});

	</script>
<!--===============================================================================================-->
	<script src="ContactFrom_v18/vendor/daterangepicker/moment.min.js"></script>
	<script src="ContactFrom_v18/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="ContactFrom_v18/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="ContactFrom_v18/js/main.js"></script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
	</script>
</body>

</html>  