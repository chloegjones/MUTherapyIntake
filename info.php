<!DOCTYPE html>
<html>
<body>

<?php
$servername = "localhost";
$username = "root";
$password = "DiFuAcv5TaGEDJ";
$dbname = "practice";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO Patient (first, last)
VALUES ('$_POST[first]', '$_POST[last]')";

if ($conn->query($sql) === TRUE) {
  header('location: http://35.193.222.252/');
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>

</body>
</html>
