<?php
if($_POST)
{
	$to_Email   	= "ricky@onehouse.net"; //Replace with recipient email address
	$subject      = 'UrbanFutsal Team Registration Form'; //Subject line for emails
	
	
	//check if its an ajax request, exit if not
    if(!isset($_SERVER['HTTP_X_REQUESTED_WITH']) AND strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) != 'xmlhttprequest') {
	
		//exit script outputting json data
		$output = json_encode(
		array(
			'type'=>'error', 
			'text' => 'Request must come from Ajax'
		));
		
		die($output);
    } 
	
	//check $_POST vars are set, exit if any missing
	if(!isset($_POST["teamName"]) || !isset($_POST["tournamentType"])|| !isset($_POST["teamManager"]) || !isset($_POST["teamManagerEmail"]) || !isset($_POST["teamManagerPhone"])) || !isset($_POST["player1"])) || !isset($_POST["player2"])) || !isset($_POST["player3"])) || !isset($_POST["player4"])) || !isset($_POST["player5"]))
	{
		$output = json_encode(array('type'=>'error', 'text' => 'Input fields are empty!'));
		die($output);
	}

	//Sanitize input data using PHP filter_var().
	$team_Name       = filter_var($_POST["teamName"], FILTER_SANITIZE_STRING);
	$team_Manager      = filter_var($_POST["teamManager"], FILTER_SANITIZE_EMAIL);
	$manager_Email    = filter_var($_POST["teamManagerEmail"], FILTER_SANITIZE_STRING);
	$manager_Phone     = filter_var($_POST["teamManagerPhone"], FILTER_SANITIZE_STRING);
	$player_1     = filter_var($_POST["player1"], FILTER_SANITIZE_STRING);
	$player_2     = filter_var($_POST["player2"], FILTER_SANITIZE_STRING);
	$player_3     = filter_var($_POST["player3"], FILTER_SANITIZE_STRING);
	$player_4     = filter_var($_POST["player4"], FILTER_SANITIZE_STRING);
	$player_5     = filter_var($_POST["player5"], FILTER_SANITIZE_STRING);
	
	//additional php validation
	if(strlen($team_Name)<0) // If length is less than 4 it will throw an HTTP error.
	{
		$output = json_encode(array('type'=>'error', 'text' => 'Please Enter A Team Name!'));
		die($output);
	}
	if(strlen($team_Manager)<0)
	{
		$output = json_encode(array('type'=>'error', 'text' => 'Please Enter A Team Manager!'));
		die($output);		
	}
	if(strlen($manager_Phone)<0)
	{
		$output = json_encode(array('type'=>'error', 'text' => 'Please Enter Team Manger Phone!'));
		die($output);		
	}
	if(!filter_var($manager_Email, FILTER_VALIDATE_EMAIL)) //email validation
	{
		$output = json_encode(array('type'=>'error', 'text' => 'Please enter a valid email!'));
		die($output);
	}
	
	//proceed with PHP email.
	$headers = 'From: '.$manager_Email.'' . "\r\n" .
	'Reply-To: '.$manager_Email.'' . "\r\n" .
	'X-Mailer: PHP/' . phpversion();
	
	$sentMail = @mail($to_Email, $subject, $team_Name, $manager_Phone, $player_1, $player_2, $player_3, $player_4, $player_5 .'  -'.$team_Manager, $headers);
	
	if(!$sentMail)
	{
		$output = json_encode(array('type'=>'error', 'text' => 'Could not send mail! Please check your PHP mail configuration.'));
		die($output);
	}else{
		$output = json_encode(array('type'=>'message', 'text' => 'Hi '.$user_Name .' Thank you for registering!'));
		die($output);
	}
}
?>