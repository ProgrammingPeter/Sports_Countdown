<?php
$team = $_GET['team'];

//create the connection config
$con = mysqli_connect('localhost','root','root','nbaschedule');
if (!$con) {
  die('Could not connect: ' . mysqli_error($con));
}
// select database
mysqli_select_db($con,"nbaschedule");

// build the SQL statement
$sql = "select * from schedules where (hometeam = '" .$team. "' OR awayteam = '".$team."')";

// Define a results cursor
$result = mysqli_query($con,$sql);

// Define the array for the result
$teamArray = Array();

// Go through the returned database rows and save them in the results array
while($row = mysqli_fetch_assoc($result)) {

	// Append the new row to the array
	$teamArray[] = $row;

}

// Return (echo) the array item encoded a json format
echo json_encode($teamArray);

// Close the connection to the Database
mysqli_close($con);
?>