<!DOCTYPE html>
<html>
<body>

<?php
$servername = "localhost";
$username = "root";
$password = "DiFuAcv5TaGEDJ";
$dbname = "phase3example";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
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
      echo "New record created successfully";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }
}elseif(isset($_POST['emergencySubmit'])){        
//    emergency_contact inputs
    $varEPFirst = $_POST['ep_first'];
    $varEPLast = $_POST['ep_last'];
    $varEPSSN = intval($_POST['ep_SSN']);
    $varEFirst = $_POST['e_first'];
    $varEMiddle = $_POST['e_middle'];
    $varELast = $_POST['e_last'];
    $varEPhoneNumber = $_POST['e_phone_number'];
    $varEEmail = $_POST['e_email'];
    $varECity = $_POST['e_city'];
    $varEZIP = $_POST['e_ZIP'];
    $varEStreet = $_POST['e_street'];
    $varEState = $_POST['e_state'];
    $varERelationship = $_POST['e_relationship_to_patient'];
    
    $sql = "INSERT INTO emergency_contact (e_first, e_middle, e_last, p_first, p_last, ssn, phone_number, email, city, zip, street, state, relationship_to_patient) VALUES ('$varEFirst', '$varEMiddle', '$varELast', '$varEPFirst', '$varEPLast', $varEPSSN, '$varEPhoneNumber', '$varEEmail', '$varECity', '$varEZIP', '$varEStreet', '$varEState', '$varERelationship');";
    
    if ($conn->query($sql) === TRUE) {
      echo "New record created successfully";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }
}elseif(isset($_POST['alternateSubmit'])){   
    //    alternate_person inputs
    $varAPFirst = $_POST['ap_first'];
    $varAPLast = $_POST['ap_last'];
    $varAPSSN = intval($_POST['ap_SSN']);
    $varAFirst = $_POST['a_first'];
    $varAMiddle = $_POST['a_middle'];
    $varALast = $_POST['a_last'];
    $varAPhoneNumber = $_POST['a_phone_number'];
    $varAEmail = $_POST['a_email'];
    $varACity = $_POST['a_city'];
    $varAZIP = $_POST['a_ZIP'];
    $varAStreet = $_POST['a_street'];
    $varAState = $_POST['a_state'];
    $varARelationship = $_POST['a_relationship_to_patient'];
    
     $sql = "INSERT INTO alternate_person (p_first, p_last, ssn, a_first, a_middle, a_last, phone_number, email, city, ZIP, street, state, relationship_to_patient) VALUES ('$varAPFirst', '$varAPLast', $varAPSSN, '$varAFirst', '$varAMiddle', '$varALast', '$varAPhoneNumber', '$varAEmail', '$varACity', '$varAZIP', '$varAStreet', '$varAState', '$varARelationship')";
     
     if ($conn->query($sql) === TRUE) {
      echo "New record created successfully";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }
 }elseif(isset($_POST['reasonSubmit'])){   
     //    reason_for_visit inputs
    $varTypeOfTherapy = $_POST['type_of_therapy'];
    $varLocation = $_POST['location'];
    $varLevel = $_POST['level'];
     
     $sql = "INSERT INTO reason_for_visit (type_of_therapy, location, level) VALUES ('$varTypeOfTherapy', '$varLocation', '$varLevel')";
     
    $sql = "INSERT INTO states_a(ssn, first, last, type_of_therapy)VALUES($varSSN, '$varFirst', '$varLast', '$varTypeOfTherapy')";
     
    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }
 }elseif(isset($_POST['insuranceSubmit'])){   
    //    insurance inputs
    $varIssuerNum = intval($_POST['issuer_number']);
    $varServicePhone = $_POST['service_phone_number'];
    $varCompanyName = $_POST['company_name'];
    $varGroupNum = intval($_POST['group_number']);
    $varIdNum = intval($_POST['id_number']);

     $sql = "INSERT INTO insurance (issuer_number, service_phone_number, company_name, group_number, id_number) VALUES ('$varIssuerNum', '$varServicePhone', '$varCompanyName', '$varGroupNum', '$varIdNum')";
    
    $sql = "INSERT INTO uses (issuer_number, ssn, first, last) VALUES ('$varIssuerNum', $varSSN, '$varFirst', '$varLast')";
     
     if ($conn->query($sql) === TRUE) {
      echo "New record created successfully";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }
 }elseif(isset($_POST['recordSubmit'])){  
    //    medical record inputs
    $varRID = intval($_POST['RID']);
    $varMedication = $_POST['medication'];
    $varFamilyHistory = $_POST['family_history'];
    $varAllergies = $_POST['allergies'];
    $varImmunizations = $_POST['immunizations'];
    $varOperations = $_POST['operations'];
      
     $sql = "INSERT INTO medical_record (RID, medications, family_history, allergies, immunizations, operations) VALUES ('$varRID', '$varMedication', '$varFamilyHistory', '$varAllergies', '$varImmunizations', '$varOperations')"; 
      
    $sql = "INSERT INTO has_a(RID, ssn, p_first, p_last)VALUES($varRID, $varSSN, '$varFirst', '$varLast')";
    
      if ($conn->query($sql) === TRUE) {
      echo "New record created successfully";
        } else {
          echo "Error: " . $sql . "<br>" . $conn->error;
        }
}elseif(isset($_POST['doctorSubmit'])){ 
     //    doctor inputs
    $varUPIN = intval($_POST['UPIN']);
    $varDName = $_POST['doctor_name'];
    
    $sql = "INSERT INTO doctor (UPIN, doctor_name) VALUES ($varUPIN, '$varDName')";
    
    $sql = "INSERT INTO sees_a(UPIN, doctor_name, ssn, p_first, p_last)VALUES($varUPIN, '$varDName', $varSSN, '$varFirst', '$varLast')";
    
       if ($conn->query($sql) === TRUE) {
          echo "New record created successfully";
        } else {
          echo "Error: " . $sql . "<br>" . $conn->error;
        }
}elseif(isset($_POST['clinicSubmit'])){  
    // clinic
    $varClinicName = $_POST['clinic_name'];
    $varCCity = $_POST['c_city'];
    $varCZIP = $_POST['c_ZIP'];
    $varCStreet = $_POST['c_street'];
    $varCState = $_POST['c_state'];
    $varStart = $_POST['start_date']; 
    $varEnd = $_POST['end_date'];
          
    $sql = "INSERT INTO clinic (clinic_name, city, ZIP, street, state, start_date, end_date) VALUES ('$varClinicName', '$varCCity', '$varCZIP', '$varCStreet', '$varCState', '$varStart', '$varEnd')";
      
      if ($conn->query($sql) === TRUE) {
      echo "New record created successfully";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }
}elseif(isset($_POST['treatmentSubmit'])){  
    // treatment_plan
    $varTPFirst = $_POST['tp_first'];
    $varTPLast = $_POST['tp_last'];
    $varTPSSN = intval($_POST['tp_SSN']);
    $varGoals = $_POST['goals'];
    $varTimeline = $_POST['timeline'];
    $varActivities = $_POST['activities'];
    $varOther = $_POST['other_areas_of_concern'];
      
      $sql = "INSERT INTO treatment_plan (SSN, p_first, p_last, goals, timeline, activities, other_areas_of_concern) VALUES ($varTPSSN, '$varTPFirst', '$varTPLast','$varGoals', '$varTimeline', '$varActivities', '$varOther')";
    
    if ($conn->query($sql) === TRUE) {
  echo "New record created successfully";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }
}else{
    echo "Something is wrong with the submit button. Please contact your administrator.";
}


    
$conn->close();
?>

</body>
</html>