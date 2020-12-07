# MUTherapyIntake
This is the web interface to our therapy intake system database. This interface allows therapists at MU Therapy to fill out an intake form digitally and easily look up information about patients.

# Languages Used:
- php
- html
- css

# Technology used:
- Google Cloud web servers
- PHPMyAdmin

# about.html:
This is the about page with a description of the website.

# index.html:
This is the main intake form.
<br>Step 1: Input First Name, Last Name and SSN of patient.<br>Step 2: Go to the section you want to submit: <li>- Patient Info (required)<li>- Emergency Contact (not required)<li>- Alternative Person (not required)<li>- Reason for Visit (required)<li>- Insurance (required)<li>- Medical Record (required)<li>- Doctor(required)<li>- Clinic (required)<Br>- Treatement Plan (required) <br>Step 3: Click submit which submits a form to info.php to perform the insertion. You will be redirected, but use the back button to submit more information.


# search.html: DELETE, ALTER, and SEARCH functions
This page allows you to search and change the database.

# search.php:
This page contains functions delete, update, and search to manipulate the database using inpupt from search.html.

Search Function Example:
<?php
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
?>

Delete Function Example:
<?php
$varDSSN = intval($_POST['dssn']);
    $sql = "DELETE FROM alternate_person WHERE ssn=$varDSSN;";
    if ($conn->query($sql) === TRUE) {
      echo "Successfully deleted " .$sql."<br>";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }
?>

Alter Function Example:
<?php
 $varDSSN = intval($_POST['dssn']);
    $varNDSSN = intval($_POST['ndssn']);
    $sql = "UPDATE Patient SET ssn=$varNDSSN WHERE ssn=$varDSSN;";
    if ($conn->query($sql) === TRUE) {
      echo "Successfully updated " .$sql."<br>";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
?>

# info.php: INSERT function
Using POST, this page gets information from the form and inserts into the database. Once inserted, it shows the user if the information was successfully submitted.

Insert Function Example:
<?php
$varFirst = $_POST['first'];
$varLast = $_POST['last'];
$varSSN = intval($_POST['SSN']);  
echo "$varFirst $varLast $varSSN";

if(isset($_POST['patientSubmit'])) {
//    Patient inputs
    $varPhoneNumber = $_POST['phone_number'];
    $varEmail = $_POST['email'];
    $varCity = $_POST['city'];
    $varZIP = $_POST['ZIP'];
    $varStreet = $_POST['street'];
    $varState = $_POST['state'];
    $varRace = $_POST['race'];
    $varGender = $_POST['gender'];
    $varDOB = $_POST["DOB"];
    //Calculate age
	$dob = new DateTime($varDOB);
	$today = new DateTime('today');
	$obj = date_diff($dob, $today, FALSE);
    $varAge = $obj->y;
    
    $sql = "INSERT INTO Patient (first, last, ssn, phone_number, email, city, zip, street, state, race, age, gender, DOB) VALUES ('$varFirst', '$varLast', $varSSN, '$varPhoneNumber', '$varEmail', '$varCity', '$varZIP', '$varStreet', '$varState', '$varRace', '$varAge', '$varGender', '$varDOB');";
    
    if ($conn->query($sql) === TRUE) {
      echo "<br> New record created successfully";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }
?>
