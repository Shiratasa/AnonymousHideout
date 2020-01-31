<?php
$link = mysqli_connect('localhost', 'id10351071_shiratasa', 'Kurenai6!', 'id10351071_ano_hide');

if (!$link) 
{
  echo "Error: Unable to connect to MySQL." . PHP_EOL;
  echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
  echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;  
  exit;
}

if (!$link -> set_charset("utf8")) 
{
  printf("Error loading character set utf8: %s\n", $link -> error);
  exit();
}

if (isset($_GET)) 
{
  if ($_GET['isAdd'] == 'true') 
  {		
    $username = $_GET['name'];
    $email = $_GET['email'];
    $password = $_GET['pass'];         
    $sql = "INSERT INTO registration(id, name, email, pass) VALUES (Null, '$username', '$email', '$password')";
    $result = mysqli_query($link, $sql);
    $output = array();
    
	if ($result) 
	{
      echo "true";
	} 

	else 
	{
	  echo "false";
	}
  } 

  else
  { 
    echo "success!";
  }	
}	

mysqli_close($link);
?>