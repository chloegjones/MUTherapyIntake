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
This is the main intake form. The intake form requires the patients name and ssn to insert into the database. The form is in sections with separate submit buttons. This is because it was difficult to submit the entire form and put information in different tables. So, we created different forms for each table. Once you hit submit, the website takes you to info.php which shows if your input has errors or not.

# info.html: INSERT function
Using POST, this page gets information from the form and inserts into the database. Once inserted, it shows the user if the information was successfully submitted.

# search.html: DELETE, ALTER, and SEARCH functions
This page allows you to search and change the database. The search function searches by first name, last name, or ssn and pulls up patients and doctors. The delete function allows you to completely delete a patient based on ssn. The update function allows you to update the ssn of the patient.

# search.php:
This page contains functions delete, update, and search to manipulate the database using inpupt from search.html.



