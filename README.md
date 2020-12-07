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
<br><h4> Step 1: Input First Name, Last Name and SSN of patient.<br>Step 2: Go to the section you want to submit: <br>Patient Info (required)<br>Emergency Contact (not required)<br>Alternative Person (not required)<br>Reason for Visit (required)<br>Insurance (required)<br>Medical Record (required)<br> Doctor(required)<br>Clinic (required)<Br>Treatement Plan (required) <br>Step 3: Click submit which submits a form to info.php to perform the insertion. You will be redirected, but use the back button to submit more information.</h4>


# search.html: DELETE, ALTER, and SEARCH functions
This page allows you to search and change the database. The search function searches by first name, last name, or ssn and pulls up patients and doctors. The delete function allows you to completely delete a patient based on ssn. The update function allows you to update the ssn of the patient.

# search.php:
This page contains functions delete, update, and search to manipulate the database using inpupt from search.html.

# info.html: INSERT function
Using POST, this page gets information from the form and inserts into the database. Once inserted, it shows the user if the information was successfully submitted.

