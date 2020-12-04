CREATE TABLE `alternate_person` (
  `p_first` varchar(50) NOT NULL,
  `p_last` varchar(50) NOT NULL,
  `ssn` int(9) NOT NULL,
  `a_first` varchar(50) NOT NULL,
  `a_middle` varchar(50) NOT NULL,
  `a_last` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(6) NOT NULL,
  `street` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `relationship_to_patient` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `belongs_to` (
  `clinic_name` varchar(50) NOT NULL,
  `zip` int(5) NOT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `UPIN` int(10) NOT NULL,
  `doctor_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `clinic` (
  `clinic_name` varchar(50) NOT NULL,
  `zip` int(5) NOT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `start_date` varchar(50) NOT NULL,
  `end_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `doctor` (
  `UPIN` int(10) NOT NULL,
  `doctor_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `emergency_contact` (
  `e_first` varchar(50) NOT NULL,
  `e_middle` varchar(50) NOT NULL,
  `e_last` varchar(50) NOT NULL,
  `p_first` varchar(50) NOT NULL,
  `p_last` varchar(50) NOT NULL,
  `ssn` int(9) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(6) NOT NULL,
  `street` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `relationship_to_patient` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `has_a` (
  `RID` int(10) NOT NULL,
  `ssn` int(9) NOT NULL,
  `p_first` varchar(50) NOT NULL,
  `p_last` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `has_access_to` (
  `UPIN` int(10) NOT NULL,
  `doctor_name` varchar(50) NOT NULL,
  `RID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `insurance` (
  `issuer_number` int(5) NOT NULL,
  `service_phone_number` varchar(10) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `group_number` int(5) NOT NULL,
  `id_number` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `medical_record` (
  `RID` int(10) NOT NULL,
  `medications` varchar(50) NOT NULL,
  `family_history` varchar(50) NOT NULL,
  `allergies` varchar(50) NOT NULL,
  `immunizations` varchar(50) NOT NULL,
  `operations` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Patient` (
  `first` varchar(50) NOT NULL,
  `last` varchar(50) NOT NULL,
  `ssn` int(9) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(6) NOT NULL,
  `street` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `race` varchar(50) NOT NULL,
  `age` int(3) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `DOB` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `primary_care` (
  `UPIN` int(10) NOT NULL,
  `doctor_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `reason_for_visit` (
  `type_of_therapy` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `sees_a` (
  `UPIN` int(10) NOT NULL,
  `doctor_name` varchar(50) NOT NULL,
  `ssn` int(9) NOT NULL,
  `p_first` varchar(50) NOT NULL,
  `p_last` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `specialist` (
  `UPIN` int(10) NOT NULL,
  `doctor_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `states_a` (
  `ssn` int(9) NOT NULL,
  `first` varchar(50) NOT NULL,
  `last` varchar(50) NOT NULL,
  `type_of_therapy` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `therapist` (
  `UPIN` int(10) NOT NULL,
  `doctor_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `treatment_plan` (
  `ssn` int(9) NOT NULL,
  `p_first` varchar(50) NOT NULL,
  `p_last` varchar(50) NOT NULL,
  `goals` varchar(50) NOT NULL,
  `timeline` varchar(50) NOT NULL,
  `activities` varchar(50) NOT NULL,
  `other_areas_of_concern` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `uses` (
  `issuer_number` int(5) NOT NULL,
  `ssn` int(9) NOT NULL,
  `first` varchar(50) NOT NULL,
  `last` varchar(50) NOT NULL,
  `answer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `alternate_person`
  ADD PRIMARY KEY (`a_first`,`a_middle`,`a_last`,`p_first`,`p_last`,`ssn`),
  ADD KEY `p_first` (`p_first`),
  ADD KEY `p_last` (`p_last`),
  ADD KEY `ssn` (`ssn`);

ALTER TABLE `belongs_to`
  ADD PRIMARY KEY (`clinic_name`,`zip`,`city`,`street`,`state`,`UPIN`,`doctor_name`),
  ADD KEY `zip` (`zip`),
  ADD KEY `city` (`city`),
  ADD KEY `street` (`street`),
  ADD KEY `state` (`state`),
  ADD KEY `UPIN` (`UPIN`),
  ADD KEY `doctor_name` (`doctor_name`);

ALTER TABLE `clinic`
  ADD PRIMARY KEY (`clinic_name`,`zip`,`city`,`street`,`state`),
  ADD UNIQUE KEY `clinic_name` (`clinic_name`),
  ADD UNIQUE KEY `zip` (`zip`),
  ADD UNIQUE KEY `street` (`street`),
  ADD KEY `state` (`state`) USING BTREE,
  ADD KEY `city` (`city`) USING BTREE;

ALTER TABLE `doctor`
  ADD PRIMARY KEY (`UPIN`,`doctor_name`),
  ADD UNIQUE KEY `UPIN` (`UPIN`),
  ADD UNIQUE KEY `doctor_name` (`doctor_name`);

ALTER TABLE `emergency_contact`
  ADD PRIMARY KEY (`e_first`,`e_middle`,`e_last`,`p_first`,`p_last`,`ssn`),
  ADD KEY `p_first` (`p_first`),
  ADD KEY `p_last` (`p_last`),
  ADD KEY `ssn` (`ssn`);

ALTER TABLE `has_a`
  ADD PRIMARY KEY (`RID`,`ssn`,`p_first`,`p_last`),
  ADD KEY `p_first` (`p_first`),
  ADD KEY `p_last` (`p_last`),
  ADD KEY `ssn` (`ssn`);

ALTER TABLE `has_access_to`
  ADD PRIMARY KEY (`UPIN`,`doctor_name`,`RID`),
  ADD KEY `doctor_name` (`doctor_name`),
  ADD KEY `RID` (`RID`);

ALTER TABLE `insurance`
  ADD PRIMARY KEY (`issuer_number`),
  ADD UNIQUE KEY `issuer_number` (`issuer_number`);

ALTER TABLE `medical_record`
  ADD PRIMARY KEY (`RID`),
  ADD UNIQUE KEY `RID` (`RID`);

ALTER TABLE `Patient`
  ADD PRIMARY KEY (`first`,`last`,`ssn`) USING BTREE,
  ADD UNIQUE KEY `ssn` (`ssn`),
  ADD KEY `last` (`last`) USING BTREE,
  ADD KEY `first` (`first`) USING BTREE;

ALTER TABLE `primary_care`
  ADD PRIMARY KEY (`UPIN`,`doctor_name`),
  ADD KEY `doctor_name` (`doctor_name`);

ALTER TABLE `reason_for_visit`
  ADD PRIMARY KEY (`type_of_therapy`),
  ADD UNIQUE KEY `type_of_therapy` (`type_of_therapy`);

ALTER TABLE `sees_a`
  ADD PRIMARY KEY (`UPIN`,`doctor_name`,`ssn`,`p_first`,`p_last`),
  ADD KEY `doctor_name` (`doctor_name`),
  ADD KEY `p_first` (`p_first`),
  ADD KEY `p_last` (`p_last`),
  ADD KEY `ssn` (`ssn`);

ALTER TABLE `specialist`
  ADD PRIMARY KEY (`UPIN`,`doctor_name`),
  ADD KEY `doctor_name` (`doctor_name`);

ALTER TABLE `states_a`
  ADD PRIMARY KEY (`ssn`,`first`,`last`,`type_of_therapy`),
  ADD KEY `first` (`first`),
  ADD KEY `last` (`last`),
  ADD KEY `type_of_therapy` (`type_of_therapy`);

ALTER TABLE `therapist`
  ADD PRIMARY KEY (`UPIN`,`doctor_name`),
  ADD KEY `doctor_name` (`doctor_name`);

ALTER TABLE `treatment_plan`
  ADD PRIMARY KEY (`ssn`,`p_first`,`p_last`,`goals`),
  ADD KEY `p_first` (`p_first`),
  ADD KEY `p_last` (`p_last`);

ALTER TABLE `uses`
  ADD PRIMARY KEY (`issuer_number`,`ssn`,`first`,`last`),
  ADD KEY `first` (`first`),
  ADD KEY `last` (`last`),
  ADD KEY `ssn` (`ssn`);


ALTER TABLE `alternate_person`
  ADD CONSTRAINT `alternate_person_ibfk_1` FOREIGN KEY (`p_first`) REFERENCES `Patient` (`first`),
  ADD CONSTRAINT `alternate_person_ibfk_2` FOREIGN KEY (`p_last`) REFERENCES `Patient` (`last`),
  ADD CONSTRAINT `alternate_person_ibfk_3` FOREIGN KEY (`ssn`) REFERENCES `Patient` (`ssn`);

ALTER TABLE `belongs_to`
  ADD CONSTRAINT `belongs_to_ibfk_1` FOREIGN KEY (`clinic_name`) REFERENCES `clinic` (`clinic_name`),
  ADD CONSTRAINT `belongs_to_ibfk_2` FOREIGN KEY (`zip`) REFERENCES `clinic` (`zip`),
  ADD CONSTRAINT `belongs_to_ibfk_3` FOREIGN KEY (`city`) REFERENCES `clinic` (`city`),
  ADD CONSTRAINT `belongs_to_ibfk_4` FOREIGN KEY (`street`) REFERENCES `clinic` (`street`),
  ADD CONSTRAINT `belongs_to_ibfk_5` FOREIGN KEY (`state`) REFERENCES `clinic` (`state`),
  ADD CONSTRAINT `belongs_to_ibfk_6` FOREIGN KEY (`UPIN`) REFERENCES `doctor` (`UPIN`),
  ADD CONSTRAINT `belongs_to_ibfk_7` FOREIGN KEY (`doctor_name`) REFERENCES `doctor` (`doctor_name`);

ALTER TABLE `emergency_contact`
  ADD CONSTRAINT `emergency_contact_ibfk_1` FOREIGN KEY (`p_first`) REFERENCES `Patient` (`first`),
  ADD CONSTRAINT `emergency_contact_ibfk_2` FOREIGN KEY (`p_last`) REFERENCES `Patient` (`last`),
  ADD CONSTRAINT `emergency_contact_ibfk_3` FOREIGN KEY (`ssn`) REFERENCES `Patient` (`ssn`);

ALTER TABLE `has_a`
  ADD CONSTRAINT `has_a_ibfk_1` FOREIGN KEY (`RID`) REFERENCES `medical_record` (`RID`),
  ADD CONSTRAINT `has_a_ibfk_2` FOREIGN KEY (`p_first`) REFERENCES `Patient` (`first`),
  ADD CONSTRAINT `has_a_ibfk_3` FOREIGN KEY (`p_last`) REFERENCES `Patient` (`last`),
  ADD CONSTRAINT `has_a_ibfk_4` FOREIGN KEY (`ssn`) REFERENCES `Patient` (`ssn`);

ALTER TABLE `has_access_to`
  ADD CONSTRAINT `has_access_to_ibfk_1` FOREIGN KEY (`UPIN`) REFERENCES `doctor` (`UPIN`),
  ADD CONSTRAINT `has_access_to_ibfk_2` FOREIGN KEY (`doctor_name`) REFERENCES `doctor` (`doctor_name`),
  ADD CONSTRAINT `has_access_to_ibfk_3` FOREIGN KEY (`RID`) REFERENCES `medical_record` (`RID`);

ALTER TABLE `primary_care`
  ADD CONSTRAINT `primary_care_ibfk_1` FOREIGN KEY (`UPIN`) REFERENCES `doctor` (`UPIN`),
  ADD CONSTRAINT `primary_care_ibfk_2` FOREIGN KEY (`doctor_name`) REFERENCES `doctor` (`doctor_name`);

ALTER TABLE `sees_a`
  ADD CONSTRAINT `sees_a_ibfk_1` FOREIGN KEY (`UPIN`) REFERENCES `doctor` (`UPIN`),
  ADD CONSTRAINT `sees_a_ibfk_2` FOREIGN KEY (`doctor_name`) REFERENCES `doctor` (`doctor_name`),
  ADD CONSTRAINT `sees_a_ibfk_3` FOREIGN KEY (`p_first`) REFERENCES `Patient` (`first`),
  ADD CONSTRAINT `sees_a_ibfk_4` FOREIGN KEY (`p_last`) REFERENCES `Patient` (`last`),
  ADD CONSTRAINT `sees_a_ibfk_5` FOREIGN KEY (`ssn`) REFERENCES `Patient` (`ssn`);

ALTER TABLE `specialist`
  ADD CONSTRAINT `specialist_ibfk_1` FOREIGN KEY (`UPIN`) REFERENCES `doctor` (`UPIN`),
  ADD CONSTRAINT `specialist_ibfk_2` FOREIGN KEY (`doctor_name`) REFERENCES `doctor` (`doctor_name`);

ALTER TABLE `states_a`
  ADD CONSTRAINT `states_a_ibfk_1` FOREIGN KEY (`first`) REFERENCES `Patient` (`first`),
  ADD CONSTRAINT `states_a_ibfk_2` FOREIGN KEY (`last`) REFERENCES `Patient` (`last`),
  ADD CONSTRAINT `states_a_ibfk_3` FOREIGN KEY (`ssn`) REFERENCES `Patient` (`ssn`),
  ADD CONSTRAINT `states_a_ibfk_4` FOREIGN KEY (`type_of_therapy`) REFERENCES `reason_for_visit` (`type_of_therapy`);

ALTER TABLE `therapist`
  ADD CONSTRAINT `therapist_ibfk_1` FOREIGN KEY (`UPIN`) REFERENCES `doctor` (`UPIN`),
  ADD CONSTRAINT `therapist_ibfk_2` FOREIGN KEY (`doctor_name`) REFERENCES `doctor` (`doctor_name`);

ALTER TABLE `treatment_plan`
  ADD CONSTRAINT `treatment_plan_ibfk_1` FOREIGN KEY (`p_first`) REFERENCES `Patient` (`first`),
  ADD CONSTRAINT `treatment_plan_ibfk_2` FOREIGN KEY (`p_last`) REFERENCES `Patient` (`last`),
  ADD CONSTRAINT `treatment_plan_ibfk_3` FOREIGN KEY (`ssn`) REFERENCES `Patient` (`ssn`);

ALTER TABLE `uses`
  ADD CONSTRAINT `uses_ibfk_1` FOREIGN KEY (`issuer_number`) REFERENCES `insurance` (`issuer_number`),
  ADD CONSTRAINT `uses_ibfk_2` FOREIGN KEY (`first`) REFERENCES `Patient` (`first`),
  ADD CONSTRAINT `uses_ibfk_3` FOREIGN KEY (`last`) REFERENCES `Patient` (`last`),
  ADD CONSTRAINT `uses_ibfk_4` FOREIGN KEY (`ssn`) REFERENCES `Patient` (`ssn`);
