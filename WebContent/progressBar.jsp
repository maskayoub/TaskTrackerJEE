<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<!DOCTYPE html>
<html>
<title>Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="prog.css" rel="stylesheet" media="all">
<style>
h1,h2,h3,h4,h5,h6 {font-family: "Oswald"}
body {font-family: "Open Sans"}


<c:choose>
    <c:when test="${prog >=0 and prog <= 20}">
        .progress-bar {
  width: ${prog}%;
  background-color: #f63a0f;
}
        </c:when>
    <c:when test="${prog >20 and prog <= 40}">    
         .progress-bar {
  width: ${prog}%;
  background-color: #f27011;
} 
        </c:when>
    <c:when test="${prog >40 and prog <= 60}">    
         .progress-bar {
  width: ${prog}%;
  background-color: #f2b01e;
} 
        </c:when>
    <c:when test="${prog >60 and prog <= 80}">    
         .progress-bar {
  width: ${prog}%;
  background-color: #f2d31b;
} 
        </c:when>
    <c:when test="${prog >80 and prog <= 100}">    
         .progress-bar {
  width: ${prog}%;
  background-color: #86e01e;
} 
        </c:when>
</c:choose>

h2{
	border-radius: 3px;
}


</style>


<body class="w3-light-grey">

<!-- Navigation bar with social media icons -->
<div class="w3-bar w3-black w3-hide-small">
  <a href="#" class="w3-bar-item w3-button"><i class="fa fa-facebook-official"></i></a>
  <a href="#" class="w3-bar-item w3-button"><i class="fa fa-instagram"></i></a>
  <a href="#" class="w3-bar-item w3-button"><i class="fa fa-snapchat"></i></a>
  <a href="#" class="w3-bar-item w3-button"><i class="fa fa-flickr"></i></a>
  <a href="#" class="w3-bar-item w3-button"><i class="fa fa-twitter"></i></a>
  <a href="#" class="w3-bar-item w3-button"><i class="fa fa-linkedin"></i></a>
  <a href="#" class="w3-bar-item w3-button w3-right"><i class="fa fa-search"></i></a>
</div>
  
<!-- w3-content defines a container for fixed size centered content, 
and is wrapped around the whole page content, except for the footer in this example -->
<div class="w3-content" style="max-width:1600px">

  <!-- Header -->
  <header class="w3-container w3-center w3-padding-48 w3-white">
    <h1 class="w3-xxxlarge"><b>Soyez assurés que nous traiterons votre demande en priorité!</b></h1>
    <br>
    <br>
    <br>
    <h6>Simplifiez votre vie avec <span class="w3-tag">TaskTracker</span></h6>
 


  </header>
  <br>
  <br>
<%-- <h3 align="center">Statut: <span style="color:green">${status}</span></h3> --%>
<!-- <div class="container"> -->
  

<!--   <div class="progress"> -->
<!--     <div class="progress-bar"></div> -->
<!--   </div> -->
<%-- </div><h2 align="center">${prog}%</h2> --%>

 
 <div class="container">
        <div class="w3-center" >
          <h3 align="center">Statut: <span style="color:green">${status}</span></h3>
			</div><h5 align="center">${prog}%</h5>
			<div class="progress">
    <div class="progress-bar"></div>
  </div>
        </div>
 </div>
<footer class="w3-container w3-dark-grey" style="padding:32px">

  <a href="empIndex.jsp" class="w3-button w3-black w3-padding-large w3-margin-bottom"><i class="fa fa-arrow-up w3-margin-right"></i>Retour</a>
</footer>

<script>
// Toggle between hiding and showing blog replies/comments
document.getElementById("myBtn").click();
function myFunction(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}

function likeFunction(x) {
  x.style.fontWeight = "bold";
  x.innerHTML = " Liked";
}
</script>

</body>
</html>



