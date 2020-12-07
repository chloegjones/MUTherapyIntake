
<!DOCTYPE html>
<html>
<body>

<?php
$servername = "localhost";
$username = "root";
$password = "DiFuAcv5TaGEDJ";
$dbname = "phase3";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


if(isset($_POST['patientSearch'])){
    $varFirst = $_POST['fname'];
    $varLast = $_POST['lname'];
    $varSSN = intval($_POST['ssn']);
    
    $sql = "SELECT * FROM Patient WHERE first='$varFirst' OR last='$varLast' OR ssn=$varSSN";
    $result = $conn->query($sql);
   
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
        echo "Name: " . $row["first"]. " " . $row["last"]. " SSN: " . $row["ssn"]. " Number: " . $row["phone_number"]. "<br>";
        }
    } else {
        echo "0 results";
    } 
    
}
if(isset($_POST['patientSearchMed'])){    
    $sql = "SELECT medical_record.medications,has_a.p_first, has_a.p_last FROM has_a INNER JOIN medical_record ON has_a.RID=medical_record.RID;";
    
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
        echo "Patient Name: " . $row["p_first"]. " " . $row["p_last"]. " Doctor Name: " . $row["medications"]. "<br>";
        }
    } else {
        echo "0 results";
    } 
}
if(isset($_POST['doctorSearch'])){
    $varDName = $_POST['dfname'];
    
    $sql = "SELECT * FROM sees_a WHERE doctor_name='$varDName'";
    
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
        echo "Patient Name: " . $row["p_first"]. " " . $row["p_last"]. " Doctor Name: " . $row["doctor_name"]. "<br>";
        }
    } else {
        echo "0 results";
    } 
}
    
if(isset($_POST['doctorShowAllSearch'])){
    
    $sql = "SELECT sees_a.doctor_name, Patient.first, Patient.last FROM sees_a INNER JOIN Patient ON sees_a.ssn=Patient.ssn;";
    
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
        echo "Patient Name: " . $row["first"]. " " . $row["last"]. " Doctor Name: " . $row["doctor_name"]. "<br>";
        }
    } else {
        echo "0 results";
    } 
    
    $sql1 = "SELECT COUNT(UPIN) as Total FROM doctor;";
    
    $result1 = $conn->query($sql);
    $i = 0;
    if ($result1->num_rows > 0) {
        while($row = $result1->fetch_assoc()) {
        $i = $i+1;
        }
        echo "Total Number of Doctors: $i";
    } else {
        echo "0 results";
    } 
}
    
    
if(isset($_POST['delete'])){
    $varDSSN = intval($_POST['dssn']);
    $sql = "DELETE FROM alternate_person WHERE ssn=$varDSSN;";
    if ($conn->query($sql) === TRUE) {
      echo "Successfully deleted " .$sql."<br>";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }
    $sql1 = "DELETE FROM emergency_contact WHERE ssn=$varDSSN;";
    if ($conn->query($sql1) === TRUE) {
      echo "Successfully deleted " .$sql1."<br>";
    } else {
      echo "Error: " . $sql1 . "<br>" . $conn->error;
    }
     $sql2 =    "DELETE FROM treatment_plan WHERE ssn=$varDSSN;";
    if ($conn->query($sql2) === TRUE) {
      echo "Successfully deleted " .$sql2."<br>";
    } else {
      echo "Error: " . $sql2 . "<br>" . $conn->error;
    }
     $sql3 =    "DELETE FROM states_a WHERE ssn=$varDSSN;";
    if ($conn->query($sql3) === TRUE) {
      echo "Successfully deleted " .$sql3."<br>";
    } else {
      echo "Error: " . $sql3 . "<br>" . $conn->error;
    }
     $sql4 =    "DELETE FROM uses WHERE ssn=$varDSSN;";
    if ($conn->query($sql4) === TRUE) {
      echo "Successfully deleted " .$sql4."<br>";
    } else {
      echo "Error: " . $sql4 . "<br>" . $conn->error;
    }
     $sql5 =    "DELETE FROM has_a WHERE ssn=$varDSSN;";
    if ($conn->query($sql5) === TRUE) {
      echo "Successfully deleted " .$sql5."<br>";
    } else {
      echo "Error: " . $sql5 . "<br>" . $conn->error;
    }
     $sql6 =    "DELETE FROM sees_a WHERE ssn=$varDSSN;";
    if ($conn->query($sql6) === TRUE) {
      echo "Successfully deleted " .$sql6."<br>";
    } else {
      echo "Error: " . $sql6 . "<br>" . $conn->error;
    }
     $sql7 =    "DELETE FROM Patient WHERE ssn=$varDSSN;";
  if ($conn->query($sql7) === TRUE) {
      echo "Successfully deleted " .$sql7."<br>";
    } else {
      echo "Error: " . $sql7 . "<br>" . $conn->error;
    }
}
if(isset($_POST['update'])){
    $varDSSN = intval($_POST['dssn']);
    $varNDSSN = intval($_POST['ndssn']);
    $sql = "UPDATE Patient SET ssn=$varNDSSN WHERE ssn=$varDSSN;";
    if ($conn->query($sql) === TRUE) {
      echo "Successfully updated " .$sql."<br>";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }$sql7 = "UPDATE alternate_person SET ssn=$varNDSSN WHERE ssn=$varDSSN;";
    if ($conn->query($sql) === TRUE) {
      echo "Successfully updated" .$sql7."<br>";
    } else {
      echo "Error: " . $sql7 . "<br>" . $conn->error;
    }
    $sql1 = "UPDATE emergency_contact SET ssn=$varNDSSN WHERE ssn=$varDSSN;";
    if ($conn->query($sql1) === TRUE) {
      echo "Successfully updated " .$sql1."<br>";
    } else {
      echo "Error: " . $sql1 . "<br>" . $conn->error;
    }
     $sql2 =    "UPDATE treatment_plan SET ssn=$varNDSSN WHERE ssn=$varDSSN;";
    if ($conn->query($sql2) === TRUE) {
      echo "Successfully updated " .$sql2."<br>";
    } else {
      echo "Error: " . $sql2 . "<br>" . $conn->error;
    }
     $sql3 =    "UPDATE states_a SET ssn=$varNDSSN WHERE ssn=$varDSSN;";
    if ($conn->query($sql3) === TRUE) {
      echo "Successfully updated " .$sql3."<br>";
    } else {
      echo "Error: " . $sql3 . "<br>" . $conn->error;
    }
     $sql4 =    "UPDATE uses SET ssn=$varNDSSN WHERE ssn=$varDSSN;";
    if ($conn->query($sql4) === TRUE) {
      echo "Successfully updated " .$sql4."<br>";
    } else {
      echo "Error: " . $sql4 . "<br>" . $conn->error;
    }
     $sql5 =    "UPDATE has_a SET ssn=$varNDSSN WHERE ssn=$varDSSN;";
    if ($conn->query($sql5) === TRUE) {
      echo "Successfully updated " .$sql5."<br>";
    } else {
      echo "Error: " . $sql5 . "<br>" . $conn->error;
    }
     $sql6 =    "UPDATE sees_a SET ssn=$varNDSSN WHERE ssn=$varDSSN;";
    if ($conn->query($sql6) === TRUE) {
      echo "Successfully updated " .$sql6."<br>";
    } else {
      echo "Error: " . $sql6 . "<br>" . $conn->error;
    }
}
$conn->close();
?>
<br><a href='http://35.193.222.252/search.html'>Back</a>

</body>
</html>