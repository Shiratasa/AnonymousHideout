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
    $result = mysqli_query($link, "SELECT * FROM registration WHERE name = '$username'");
    $output = array();
    
    if ($result) 
    {
	  while ($row = mysqli_fetch_assoc($result))
	  {
	    $output[] = $row;
	  }	

	  echo json_encode($output);
	} 
  } 

  else
  { 
    echo "success!";
  }	
}	

mysqli_close($link);
//https://www.thaicreate.com/community/php-mysqli-json.html
?>