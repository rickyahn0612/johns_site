<?php
if($_POST)
{
	$to_Email   	= "ricky@onehouse.net"; //Replace with recipient email address
	$subject        = 'UrbanFutsal Team Registration Form'; //Subject line for emails
	
	
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
	if(!isset($_POST["teamName"]) || !isset($_POST["teamManager"]) || !isset($_POST["teamManagerEmail"]) || !isset($_POST["teamManagerPhone"])) || !isset($_POST["player1"])) || !isset($_POST["player2"])) || !isset($_POST["player3"])) || !isset($_POST["player4"])) || !isset($_POST["player5"]))
	{
		$output = json_encode(array('type'=>'error', 'text' => 'Input fields are empty!'));
		die($output);
	}

	//Sanitize input data using PHP filter_var().
	$user_Name        = filter_var($_POST["teamName"], FILTER_SANITIZE_STRING);
	$user_Email       = filter_var($_POST["teamManager"], FILTER_SANITIZE_EMAIL);
	$user_Phone       = filter_var($_POST["teamManagerEmail"], FILTER_SANITIZE_STRING);
	$user_Message     = filter_var($_POST["teamManagerPhone"], FILTER_SANITIZE_STRING);
	$user_Message     = filter_var($_POST["player1"], FILTER_SANITIZE_STRING);
	$user_Message     = filter_var($_POST["player2"], FILTER_SANITIZE_STRING);
	$user_Message     = filter_var($_POST["player3"], FILTER_SANITIZE_STRING);
	$user_Message     = filter_var($_POST["player4"], FILTER_SANITIZE_STRING);
	$user_Message     = filter_var($_POST["player5"], FILTER_SANITIZE_STRING);
	
	//additional php validation
	if(strlen($user_Name)<4) // If length is less than 4 it will throw an HTTP error.
	{
		$output = json_encode(array('type'=>'error', 'text' => 'Name is too short or empty!'));
		die($output);
	}
	if(!filter_var($user_Email, FILTER_VALIDATE_EMAIL)) //email validation
	{
		$output = json_encode(array('type'=>'error', 'text' => 'Please enter a valid email!'));
		die($output);
	}
	if(!is_numeric($user_Phone)) //check entered data is numbers
	{
		$output = json_encode(array('type'=>'error', 'text' => 'Only numbers allowed in phone field'));
		die($output);
	}
	if(strlen($user_Message)<5) //check emtpy message
	{
		$output = json_encode(array('type'=>'error', 'text' => 'Too short message! Please enter something.'));
		die($output);
	}
	
	//proceed with PHP email.
	$headers = 'From: '.$user_Email.'' . "\r\n" .
	'Reply-To: '.$user_Email.'' . "\r\n" .
	'X-Mailer: PHP/' . phpversion();
	
	$sentMail = @mail($to_Email, $subject, $user_Message .'  -'.$user_Name, $headers);
	
	if(!$sentMail)
	{
		$output = json_encode(array('type'=>'error', 'text' => 'Could not send mail! Please check your PHP mail configuration.'));
		die($output);
	}else{
		$output = json_encode(array('type'=>'message', 'text' => 'Hi '.$user_Name .' Thank you for your email'));
		die($output);
	}
}
?>