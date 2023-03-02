


<html>
  <head>
    <title>Login</title>
    <link href="loginTemplate/login.css" rel="stylesheet" media="all">
    
  </head>
  <body>
    
    <div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action = "inscription.php" method = post>
			<h3>Créer Un Compte</h3>
			<span>Utilisez votre email pour s'enregistrer</span>
			<input type="text" name="username" placeholder="Nom d'utilisateur" />
			<input type="text" name="name" placeholder="Nom" />
			<input type="text" name="lastname" placeholder="Prénom" />
			<input type="email" name="email" placeholder="Email" />
			<input type="text" name="gsm" placeholder="Numéro Tel" />
			<input type="password" name="mdp" placeholder="Mot De Passe" />
			<button type = "submit" name = "action"  value = "register">Confirmer</button>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action = "login.php" method = post>
			<h1>Se Connecter</h1>
			<br> <br>
			<span>Entrez votre Login et Mot De Passe</span>
			<br>
			<input type="text" name="emailuser"  placeholder="Email or Nom d'Utilisateur" />
			<input type="password" name="password"  placeholder="Mot De Passe" /><br>
			<button type = "submit" name = "action"  value = "login">Se Connecter</button>
			<br><h5>${erreur}</h5>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Bienvenue!</h1>
				<p>Pour ne rien rater, veuillez vous connecter avec vos informations personnelles</p>
				<button class="ghost" id="signIn">Se Connecter</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Salut!</h1>
				<p>Entrez vos informations personnelles et commencez votre parcours avec nous. </p>
				<p>Votre mot de passe sera en sécurité avec nous, tous les mots de passe sont envoyés dans un coffre-fort numérique crypté que nous sécurisons avec un mot de passe principal.</p>
				<button class="ghost" id="signUp">Créer Un Compte</button>
			</div>
		</div>
	</div>
</div>

<script>
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', function() {
    	container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', function() {
    	container.classList.remove("right-panel-active");
    });
    </script>
  </body>
</html> 
 