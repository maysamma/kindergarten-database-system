CREATE DATABASE IF NOT EXISTS KindergartenManagementSystem;
use KindergartenManagementSystem;

CREATE TABLE IF NOT EXISTS guardian(
name VARCHAR(30)NOT NULL,
phone_number int(10)NOT NULL,
emergency_phoneNumber int(10)NOT NULL,
address VARCHAR(50)NOT NULL,
constraint name_pk PRIMARY KEY(name)
);
SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE IF NOT EXISTS guardian_employment(
job varchar(50),
employeed VARCHAR(3),
income int(10),
name VARCHAR(30),
constraint name_fk FOREIGN KEY(name) 
REFERENCES guardian(name)
);
CREATE TABLE IF NOT EXISTS child(
gender VARCHAR(1) CHECK(gender IN ('F','M')),
special_treatement VARCHAR(200),
allergies VARCHAR(100),
name VARCHAR(50)NOT NULL,
childID INT(4)NOT NULL ,
guardian_name VARCHAR(30),
constraint guardian_name_fk FOREIGN KEY(guardian_name)
REFERENCES guardian(name),
constraint childID_pk PRIMARY KEY(childID)
);

CREATE TABLE IF NOT EXISTS child_age(
DOB VARCHAR(10),
childID int(4),
constraint childageID_fk FOREIGN KEY (childID)references child(childID),
constraint childID_DOB_pk PRIMARY KEY(childID,DOB)
);

CREATE TABLE IF NOT EXISTS principal(
name VARCHAR(30),
principalID int(5)NOT NULL UNIQUE,
constraint principalID_pk PRIMARY KEY(principalID)
);

CREATE TABLE IF NOT EXISTS principal_phone(
principalID int(5),
phoneNumber int(10),
constraint principalID_fk FOREIGN KEY(principalID)references principal(principalID),
constraint principalID_phoneNumber_pk PRIMARY KEY(principalID,phoneNumber)
);

CREATE TABLE IF NOT EXISTS principal_work(
principalID int(5),
DOE VARCHAR(10) ,
constraint DOE_fk foreign key(principalID)references principal(principalID),
constraint principalID_DOE_pk PRIMARY KEY(principalID,DOE)
);

CREATE TABLE IF NOT EXISTS teacher( /*10 teacher */
name VARCHAR(30),
teacherID int(5)NOT NULL UNIQUE,
DOE VARCHAR(10),
position VARCHAR(20),
managerID int(5),
constraint teacherID_pk PRIMARY KEY(teacherID),
constraint managerID_fk FOREIGN KEY(managerID)references principal(principalID)
);

CREATE TABLE IF NOT EXISTS class( 
num_of_children INT(2) CHECK (num_of_children <= 15),
classID int(2) NOT NULL UNIQUE,
mainTeacher int(5),
assistantTeacher int(5),
name_of_class VARCHAR(30) NOT NULL UNIQUE,
constraint classID1_pk PRIMARY KEY(classID),
constraint mainTeacherinClass_fk FOREIGN KEY(mainTeacher)references teacher(teacherID),
constraint assistantTeacherinClass_fk FOREIGN KEY(assistantTeacher)references teacher(teacherID)
);

CREATE TABLE IF NOT EXISTS attending(
childID INT(2),
classID INT(2),
starting_date VARCHAR(10),
constraint childIDattends_fk foreign key(childID)references child(childID),
constraint classID FOREIGN KEY(classID)references class(classID)
);
CREATE TABLE IF NOT EXISTS teacher_experience(
past_experience VARCHAR(200),
teacherID int(5),
constraint teacherIDexp_fk FOREIGN KEY(teacherID)references teacher(teacherID),
constraint teacherID_past_experience_pk PRIMARY KEY(teacherID,past_experience)
);

CREATE TABLE IF NOT EXISTS teacher_qualifications(
qualifications VARCHAR(200),
teacherID int(5),
constraint teacherIDqual_fk FOREIGN KEY(teacherID)references teacher(teacherID),
constraint teacherID_qualifications_pk PRIMARY KEY(teacherID,qualifications)
);

CREATE TABLE IF NOT EXISTS teacher_phone(
phone_number int(10),
teacherID int(5),
constraint teacherIDphone_fk FOREIGN KEY(teacherID)references teacher(teacherID),
constraint teacherID_phone_number_pk PRIMARY KEY(teacherID,phone_number)
);

CREATE TABLE IF NOT EXISTS teacher_work(
DOE VARCHAR(10),
teacherID int(5),
constraint teacherIDwork_fk FOREIGN KEY(teacherID)references teacher(teacherID),
constraint teacherID_DOE_pk PRIMARY KEY(teacherID,DOE)
);

CREATE TABLE IF NOT EXISTS admin(    /*5 Admin */
name VARCHAR(30),
adminID int(5)NOT NULL UNIQUE,
task VARCHAR(50),
supervisor INT(5),
constraint adminID_pk PRIMARY KEY(adminID),
constraint supervisor_fk FOREIGN KEY(supervisor)references principal(principalID)
);

CREATE TABLE IF NOT EXISTS admin_phone(
adminID int(5),
phoneNumber int(10),
constraint admin_phone_fk FOREIGN KEY(adminID)references admin(adminID),
constraint adminID_phoneNumber_pk PRIMARY KEY(adminID,phoneNumber)
);

CREATE TABLE IF NOT EXISTS admin_work(
adminID int(5),
DOE VARCHAR(10),
constraint admin_work_fk FOREIGN KEY(adminID)references admin(adminID),
constraint adminID_DOE_pk PRIMARY KEY(adminID,DOE)
);

/*------------------------------------------------------------*/
INSERT INTO guardian (name, phone_number, emergency_phoneNumber, address)
VALUES
(' Ahmad ', 0564567890, 0546543210, '123 Zat-Alsawari Street'),
(' Abdelrahman', 0505555555, 0504567890, '456 Abdullah-kiat Street'),
('Mohammad ', 0566545210, 0565555555, '789 majeed-alkahlid  Street'),
('Faisal ', 0544567890, 0546543210, '1010 Saud  Street'),
('Khaled ', 0585555555, 0584567890, '1234  Street'),
('Fahd ', 0556543210, 0555555555, '4567 Nahauand Street'),
('Hamid ', 0564567890, 0566543210, '7890 Al-Utaibiah  Street'),
(' Noor', 0545555555, 0544567890, '10100 Al-Siteen Street'),
('Rashid ', 0566543210, 0565555555, '12345 Abdullrhman-Ahmed  Street'),
(' Abdullah  ', 0584567890, 0586543210, '45678  Muhamed  Street'),
/*----------------------------------------------------------------------------------*/
('Mansour ', 0505555555, 0504567890, '78900 Al-Amal Street'),
('Majid', 0546543210, 0545555555, '101000 The64 Street'),
('Alaa ', 0564567890, 0566543210, '123456 Zat-Alsawari Street'),
('Hatem ', 0585555555, 0584567890, '456789 Abdullah-kiat Street'),
('Abdul-Majeed', 0506543210, 0505555555, '789000 majeed-alkahlid Street'),
('Tamer ', 0544567890, 0546543210, '1010000 Saud Street'),
('Saud', 0565555555, 0564567890, '1234567 Nahauand Street'),
('Ramy ', 0586543210, 0585555555, '4567890 Al-Utaibiah Street'),
 ('Thamer', 0505555555, 0504567890, '1234567 Al-Utaibiah Street'),
('Hussein', 0546543210, 0545555555, '4567890 Al-Siteen Street'),
/*----------------------------------------------------------------------------------*/
('Abdel-Salam', 0564567890, 0566543210, '7890000 Abdullrhman-Ahmed Street'),
('Ghassan', 0585555555, 0584567890, '10100000 Muhamed Street'),
('Adnan', 0506543210, 0505555555, '12345678 Al-Amal Street'),
('Walid', 0544567890, 0546543210, '45678900 The64 Street'),
('Salah', 0565647890, 0566543210, '4654 Zat-Alsawari Street'),
('Nazar', 0585554432, 0584579347, '322 Abdullah-kiat Street'),
('Rafat', 0506543210, 0501235555, '439 majeed-alkahlid Street'),
('Meshaal', 0544567890, 0546543210, '2121 Saud Street'),
('Yasser', 0565555555, 0567897890, '6543 Nahauand Street'),
('Suedan', 0586543210, 0587775555, '7777 Al-Utaibiah Street'),
/*----------------------------------------------------------------------------------*/
('Hashem', 0504567546, 0506783210, '8798 Al-Siteen Street'),
('Hisham', 0545555555, 0544567890, '1010 Abdullrhman-Ahmed Street'),
('lutfi', 0566532105, 0565555555, '12345 Muhamed Street'),
('Aqeel', 0584557000, 0586543410, '4567 Al-Amal Street'),
('Salim ', 0505555005, 0504557490, '7890 The64 Street'),
('Ayman', 0546543000, 0545555655, '10000 Zat-Alsawari Street'),
('Salem ', 0564547090, 0566543710, '13456 Abdullah-kiat Street'),
('Nabeela ', 0585555985, 0584567990, '56789 majeed-alkahlid Street'),
('Taher', 0506543880, 0505555955, '89000 Saud Street'),
('Ali', 0544567340, 0546543410, '100000 Nahauand Street'),
/*----------------------------------------------------------------------------------*/
('Abdel-Wadood', 0565555455, 0564557590, '134567 Al-Utaibiah Street'),
('Adel', 0586543560, 0585555755, '467890 Al-Siteen Street'),
('Othman', 0594567560, 0596543610, '790000 Abdullrhman-Ahmed Street'),
('Eismat ', 0595555665, 0594567690, '1100000 Muhamed Street'),
('mufrih ', 0585647890, 0596543710, '654 Zat-Alsawari Street'),
('hilal', 0595554432, 0584569747, '22 Abdullah-kiat Street'),
('Abadi', 0596543210, 0591235655, '39 majeed-alkahlid Street'),
('Abdul-Mukhtar', 0504567890, 0506544210, '211 Saud Street'),
('Zuhair', 0595555555, 0583897890, '643 Nahauand Street'),
('Almajid', 0586543210, 0591775555, '777 Al-Utaibiah Street'),
/*----------------------------------------------------------------------------------*/
('shakir', 0564567546, 0562783210, '798 Al-Siteen Street'),
('Fawzy', 0595555555, 0503567890, '010 Abdullrhman-Ahmed Street'),
('Abdul-Ghafoor', 0566543210, 0594555555, '2345 Muhamed Street'),
('sabri', 0594567000, 0585553410, '456 Al-Amal Street'),
('mueasib ', 0585555005, 0586567490, '780 The64 Street'),
('Shehab', 0566543000, 0587555655, '1000 Zat-Alsawari Street'),
('Kinan', 0584567090,0568543710, '1456 Abdullah-kiat Street'),
('faris', 0595555985, 0599567990, '5789 majeed-alkahlid Street'),
('Amer ', 0596543880, 0591555955, '8000 Saud Street'),
('Sharif', 0584567340, 0592543410, '10000 Nahauand Street'),
/*----------------------------------------------------------------------------------*/
('Suhail', 0595555455, 0583567590, '14567 Al-Utaibiah Street'),
('Tareq', 0586543560, 0594555755, '47890 Al-Siteen Street'),
('Ramzi', 0544567560, 0595543610, '70000 Abdullrhman-Ahmed Street'),
('Sami', 0565555665, 0596567690, '100000 Muhamed Street'),
('Imran', 0596543560, 0547555755, '47890 Al-Siteen Street');

INSERT INTO guardian_employment (job, employeed, income, name)
VALUES
('Teacher', 'Yes', 50000, ' Ahmad '),
('Doctor', 'Yes', 100000, ' Abdelrahman'),
('Engineer', 'Yes', 80000, 'Mohammad '),
('Lawyer', 'Yes', 70000, 'Faisal '),
('Nurse', 'Yes', 60000, 'Khaled '),
('Salesperson', 'Yes', 50000, 'Fahd '),
('Accountant', 'Yes', 40000, ' Hamid '),
('Manager', 'Yes', 30000, 'Noor'),
('Administrative Assistant', 'Yes', 20000, 'Rashid '),
('Clerk', 'Yes', 10000, ' Abdullah '),
 /*-----------------------------------------------------------------*/
('Factory Worker', 'Yes', 5000, 'Mansour '),
('Construction Worker', 'Yes', 4000, 'Majid'),
('Truck Driver', 'Yes', 3000, 'Alaa '),
('Waiter/Waitress', 'Yes', 2000, 'Hatem '),
('Sales Associate', 'Yes', 1000, 'Abdul-Majeed'),
('Retail Clerk', 'Yes', 500, 'Tamer '),
('Janitor', 'Yes', 400, 'Hatem Saud'),
('Security Guard', 'Yes', 300, 'Ramy '),
('Delivery Driver', 'Yes', 200, 'Thamer'),
('Telemarketer', 'Yes', 100, 'Hussein'),
/*-----------------------------------------------------------------*/
('Fast Food Worker', 'Yes', 50, 'Abdel-Salam'),
('Bartender', 'Yes', 40, 'Ghassan'),
('Hairdresser', 'Yes', 30, 'Adnan'),
('Personal Trainer', 'Yes', 20, 'Walid'),
('Dog Walker', 'Yes', 10, 'Salah'),
('Babysitter', 'Yes', 5, 'Nazar'),
('House Cleaner', 'Yes', 4, 'Rafat'),
('Laundromat Attendant', 'Yes', 3, 'Meshaal'),
('Parking Lot Attendant', 'Yes', 2, ' Yasser '),
('Mover', 'Yes', 1, 'Suedan'),
/*-----------------------------------------------------------------*/
('Garbage Collector', 'Yes', 2000, 'Hashem'),
('Unemployed', 'Yes', 60000, 'Hisham'),
('Retired', 'No', 5000, 'lutfi'),
('programmer', 'Yes', 22000, 'Aqeel'),
('Stay-At-Home Parent', 'No', 0, ' Salim'),
('Volunteer', 'Yes', 1000, 'Ayman'),
('translator', 'Yes', 7000, 'Salem'),
('Manager', 'Yes', 1000, 'Nabeela'),
('Teacher', 'Yes', 50600, 'Taher'),
('Doctor', 'Yes', 100500, 'Ail'),
/*-----------------------------------------------------------------*/
 ('Engineer', 'Yes', 84000, 'Abdel-Wadood'),
('Lawyer', 'Yes', 70050, 'Adel'),
('Nurse', 'Yes', 60050, 'Othman'),
('Salesperson', 'Yes', 60000, 'Eismat'),
('Accountant', 'Yes', 60000, 'mufrih'),
('Manager', 'Yes', 300600, 'hilal'),
('Administrative Assistant', 'Yes', 26000, 'Abadi'),
('Clerk', 'Yes', 10005, 'Abdul-Mukhtar'),
('Factory Worker', 'Yes', 7000, 'Zuhair'),
('Construction Worker', 'yes', 40700, 'Almajid'),
/*-----------------------------------------------------------------*/
('Truck Driver', 'Yes', 3007, 'shakir'),
('Waiter/Waitress', 'Yes', 2700, 'Fawzy'),
('Sales Associate', 'Yes', 1070, 'Abdul-Ghafoor'),
('Retail Clerk', 'Yes', 5005, 'sabri'),
('Janitor', 'Yes', 450, 'mueasib'),
('Security Guard', 'Yes', 340, 'Shehab'),
('Delivery Driver', 'Yes', 220,'Kinan'),
('Telemarketer', 'Yes', 170, 'faris'),
('Fast Food Worker', 'Yes', 56, 'Amer '),
('Bartender', 'Yes', 47, 'Sharif'),
/*-----------------------------------------------------------------*/
('Hairdresser', 'Yes', 37, 'Suhail'),
('Personal Trainer', 'Yes', 25, 'Tareq'),
('Manager', 'Yes', 14, 'Ramzi'),
('Babysitter', 'Yes', 4, 'Sami'),
('House Cleaner', 'Yes', 7, 'Imran');

INSERT INTO child (gender, special_treatement, allergies, name, childID, guardian_name)
VALUES
('F', 'social phobia', 'nothing', 'Renad', 0101,'Ahmad'),
('M','nothing', 'Peanut allergy', 'Mohamed', 0102,'Abdelrahman'),
('F', 'nothing', 'nothing', 'Rana', 0103,'Mohammad'),
('M','autistic', 'Cow milk allergy', 'Khaled ', 0104,'Faisal'),
('F', 'nothing', 'nothing', 'Rawan', 0105,'Khaled'),
('M','He suffers from hyperactivity', 'nothing', 'Khaled ', 0106,'Fahd'),
('F', 'nothing', 'egg allergy', 'Reem ', 0107, 'Hamid'),
('M', 'The child is not social and needs patience in dealing', 'nothing', 'yazan', 0108,'Noor'),
('F', 'nothing', 'nothing', 'Maya ', 0109,'Rashid'),
('M', 'nothing', 'wheat allergy', 'Wissam', 0110, 'Abdullah'),
/*-------------------------------------------------------------------------------------*/
('F', 'nothing', 'nothing', 'Lujain ', 0111, 'Mansour'),
('M', 'The child suffers from a slow understanding', 'nothing', 'Yasser', 0112, 'Majid'),
('F', 'nothing', 'nothing', 'Lama ', 0113, 'Alaa'),
('M','nothing', 'nothing', 'Ghassan', 0114,'Hatem'),
('F','nothing', 'nothing', 'Dana', 0115,'Abdul-Majeed'),
/*15 children in class 1*/
('M', 'The child has a vision deficiency', 'nothing', 'Hassan', 0201,'Tamer'),
('F', 'nothing', 'Peanut allergy', 'Raneem', 0202,'Saud'),
('M', 'nothing', 'nothing', 'Mansour ', 0203, 'Ramy'),
('F', 'nothing', 'nothing', 'Hayam', 0204,'Thamer'),
('M', 'Excess tension, the child needs to calm down always', 'egg allergy', 'Ahmed ', 0205, 'Hussein'),
/*-------------------------------------------------------------------------------------*/
('F','nothing', 'Peanut allergy', 'Hala', 0206,'Abdel-Salam'),
('M','autistic', 'Cow milk allergy', 'Khaled ', 0207,'Ghassan'),
('F', 'nothing', 'nothing', 'Rana', 0208, 'Adnan'),
('M', 'nothing', 'Corn allergy', 'Ayman', 0209,'Walid'),
('F', 'nothing', 'nothing', 'Lana', 0210,'Salah'),
('M', 'nothing', 'nothing', 'Ziyad', 0211, 'Nazar'),
('F','Hearing impairment needs to be heard by ear', 'nothing', 'Rital ', 0212,'Rafat'),
('M','nothing', 'nothing', 'Noor', 0213,'Meshaal'),
('F','nothing', 'nothing', 'Jana ', 0214, 'Yasser'),
('M','nothing', 'wheat allergy', 'Bader', 0215,'Suedan'),
/*-------------------------------------------------------------------------------------*/
/*15 children in class 2*/
('M', 'nothing', 'nothing', 'Meshaal', 0301,'Hashem'),
('F', 'nothing', 'Peanut allergy', 'Ghala', 0302,'Hisham'),
('M', 'autistic', 'nothing', 'Zahed  ', 0303, 'lutfi'),
('F', 'stammer', 'nothing', 'muaduh ', 0304,'Aqeel'),
('M','nothing', 'egg allergy', 'Adham', 0305,'Salim'),
('F', 'nothing', 'nothing', 'Samar ', 0306,'Ayman'),
('M','Difficulty concentrating', 'nothing', 'jamil', 0307, 'Salem'),
('F','nothing', 'nothing', 'Rania', 0308,'Nabeela'),
('M','nothing', 'Corn allergy', 'Faisal ', 0309,'Taher'),
('F', 'nothing', 'nothing', 'Dina', 0310,'Ail'),
/*-------------------------------------------------------------------------------------*/
('M','nothing', 'nothing', 'Hamdan', 0311,' Abdel-Wadood'),
('F', 'nothing', 'Corn sensitivity', 'Afaf ', 0312,'Adel'),
('M','nothing', 'nothing', 'Abdul', 0313,'Othman'),
('F','nothing', 'nothing', 'Othman', 0314,'Eismat'),
/*14 children in class 3*/
('F','social phobia', 'nothing', 'Renad', 0401, 'mufrih'),
('M','nothing', 'Peanut allergy', 'Mohamed', 0402, 'hilal'),
('F', 'nothing', 'nothing', 'Rana', 0403, 'Abadi'),
('M', 'autistic', 'Cow milk allergy', 'Amir', 0404, 'Abdul-Mukhtar'),
('F','nothing', 'nothing', 'Rawan', 0405,'Zuhair'),
('M','He suffers from hyperactivity', 'nothing', 'Saad ', 0406,'Almajid'),
/*-------------------------------------------------------------------------------------*/
('F','nothing', 'egg allergy', 'Reem ', 0407,'shakir'),
('M','The child is not social and needs patience in dealing', 'nothing', 'rashid', 0408,'Fawzy'),
('F','nothing', 'nothing', 'Mayar ', 0409, 'Abdul-Ghafoor  '),
('F','nothing', 'nothing', 'Lujain ', 0410,'sabri'),
('M','The child suffers from a slow understanding', 'nothing', 'Yasser', 0411,'mueasib'),
/*11 children in class 4*/
('M','The child has a vision
deficiency', 'nothing', 'Saad', 0501,'Shehab'),
('F', 'nothing', 'Peanut allergy', 'Raneem', 0502,'Kinan'),
('M', 'nothing', 'nothing', 'Abdullah ', 0503, 'faris'),
('F', 'nothing', 'nothing', 'Hayam', 0504,'Amer'),
('M','Excess tension, the child needs to calm down always', 'egg allergy', 'Haitham', 0505,'Sharif'),
/*-----------------------------------------------------------------*/
('M','autistic', 'Cow milk allergy', 'Ammar', 0506,'Suhail'),
('F','nothing', 'nothing', 'Maram', 0507,'Tareq'),
('M','nothing', 'Corn allergy', 'Ayman', 0508,'Ramzi'),
('F','nothing', 'nothing', 'Layan', 0509,' Sami'),
('M','nothing', 'Hearing impairment needs to be heard by ear', 'Ziyad', 0510, 'Imran ');
 /*10 children in class 5*/
 
INSERT INTO child_age (DOB,childID)
VALUES
('2018-03-08', 0101),
('2018-04-15', 0102),
('2019-05-22', 0103),
('2018-03-08', 0104),
('2018-04-15', 0105),
('2019-05-22', 0106),
('2018-03-08',  0107),
('2018-04-15', 0108),
('2019-05-22',  0109),
('2019-05-22',  110),
/*-----------------------------------------------------------------*/
('2018-03-08',  0111),
('2018-04-15',  0112 ),
('2019-05-22',  0113 ),
('2018-03-08',  0114 ),
('2018-04-15',  0115 ),
('2019-05-22',  0201 ),
('2018-03-08',  0202 ),
('2018-04-15',  0203),
('2019-05-22',  0204 ),
('2019-05-22',  0205),
/*-----------------------------------------------------------------*/
('2018-03-08',  0206),
('2018-04-15',  0207),
('2019-05-22',  0208),
('2018-03-08',  0209),
('2018-04-15',  0210),
('2019-05-22', 0211),
('2018-03-08',  0212),
('2018-04-15', 0213),
('2019-05-22', 0214),
('2019-05-22',  0215),
/*-----------------------------------------------------------------*/
('2018-03-08', 0301),
('2018-04-15',  0302),
('2019-05-22',  0303),
('2018-03-08',  0304),
('2018-04-15',  0305),
('2019-05-22', 0306),
('2018-03-08', 0307),
('2018-04-15',  0308),
('2019-05-22',  0309),
('2019-05-22', 0310),
/*-----------------------------------------------------------------*/
('2018-03-08',  0311),
('2018-04-15',  0312),
('2019-05-22',  0313),
('2018-03-08',  0314),
('2018-04-15',  0401),
('2019-05-22',  0402),
('2018-03-08',  0403),
('2018-04-15',  0404 ),
('2019-05-22',  0405),
('2019-05-22', 0406),
/*-----------------------------------------------------------------*/
('2018-03-08',  0407),
('2018-04-15', 0408),
('2019-05-22',0409),
('2018-03-08',  0410),
('2018-04-15',  0411),
('2019-05-22',  0501),
('2018-03-08', 0502),
('2018-04-15',  0503),
('2019-05-22',  0504),
('2019-05-22',  0505),
/*-----------------------------------------------------------------*/
('2018-03-08',  0506),
('2018-04-15',  0507),
('2019-05-22', 0508),
('2018-03-08',  0509),
('2018-04-15',  0510);
 
 INSERT INTO principal (name, principalID)
VALUES
('Hana Mubarak', 12345);

INSERT INTO  principal_phone (principalID, phoneNumber)
VALUES
(12345, 0581060995),
(12345, 0505550514);

INSERT INTO principal_work (principalID, DOE)
VALUES
(12345, '2009-06-01');

INSERT INTO teacher (name, teacherID, DOE, position, managerID)
VALUES
('Muna', 78654, '22/7/2020', 'Main Teacher', 12345),
('Shoug', 67342, '16/6/2021', 'Assistant Teacher',  12345),
('Anmar', 33542, '5/4/2019',  'Main Teacher',  12345),
('Shaima', 67304, '10/3/2020', 'Assistant Teacher', 12345),
('Maha', 21456, '8/10/2022', 'Main Teacher', 12345),
('Sama', 83401, '24/1/2021', 'Assistant Teacher', 12345),
('Hasna', 45698, '13/5/2019', 'Main Teacher' , 12345),
('Nada', 35698, '20/3/2021', 'Assistant Teacher', 12345),
('Dalal',10128, '6/9/2019 ', 'Main Teacher', 12345),
('Fajer', 22517, '28/4/2022', 'Assistant Teacher', 12345);

INSERT INTO class (num_of_children, classID, mainTeacher, assistantTeacher, name_of_class )
VALUES
(15, 01, '78654', '67342', 'butterflies'),
/*-------------------------------------------------------------------------------------*/
(15, 02, '33542', '67304','stars'),
/*-------------------------------------------------------------------------------------*/
(14, 03, '21456', '83401', 'roses'),
/*-------------------------------------------------------------------------------------*/
(11, 04, '45698', '35698','birds'),
/*------------------------------------------------------------------------------------*/
(10, 05, '10128', '22517', 'flowers');
/*-------------------------------------------------------------------------------------*/

INSERT INTO attending (childID, classID, starting_date)
VALUES 
(0101, 01, '19/7/2022'),
(0102, 01, '18/7/2022'),
(0103, 01, '20/7/2022'),
(0104, 01, '19/7/2022'),
(0105, 01, '17/7/2022'),
(0106, 01, '18/7/2022'),
(0107, 01, '20/7/2022'),
(0108, 01, '22/7/2022'),
(0109, 01, '21/7/2022'),
(0110, 01, '17/7/2022'),
(0111, 01, '19/7/2022'),
(0112, 01, '22/7/2022'),
(0113, 01, '20/7/2022'),
(0114, 01, '21/7/2022'),
(0115, 01, '17/7/2022'),
/*-------------------------------------------------------------------------------------*/
(0201, 02, '21/7/2022'),
(0202, 02, '20/7/2022'),
(0203, 02, '20/7/2022'),
(0204, 02, '25/7/2022'),
(0205, 02, '23/7/2022'),
(0206, 02, '23/7/2022'),
(0207, 02, '19/7/2022'),
(0208, 02, '22/7/2022'),
(0209, 02, '25/7/2022'),
(0210, 02, '24/7/2022'),
(0211, 02, '19/7/2022'),
(0212, 02, '21/7/2022'),
(0213, 02, '27/7/2022'),
(0214, 02, '20/7/2022'),
(0215, 02, '21/7/2022'),
/*-------------------------------------------------------------------------------------*/
(0301, 03, '20/7/2022'),
(0302, 03, '22/7/2022'),
(0303, 03, '23/7/2022'),
(0304, 03, '19/7/2022'),
(0305, 03, '18/7/2022'),
(0306, 03, '21/7/2022'),
(0307, 03, '20/7/2022'),
(0308, 03, '25/7/2022'),
(0309, 03, '24/7/2022'),
(0310, 03, '28/7/2022'),
(0311, 03, '22/7/2022'),
(0312, 03, '20/7/2022'),
(0313, 03, '28/7/2022'),
(0314, 03, '22/7/2022'),
/*-------------------------------------------------------------------------------------*/
(0401, 04, '20/7/2022'),
(0402, 04, '23/7/2022'),
(0403, 04, '22/7/2022'),
(0404, 04, '25/7/2022'),
(0405, 04, '22/7/2022'),
(0406, 04, '20/7/2022'),
(0407, 04, '27/7/2022'),
(0408, 04, '24/7/2022'),
(0409, 04, '23/7/2022'),
(0410, 04, '21/7/2022'),
(0411, 04, '28/7/2022'),
/*-------------------------------------------------------------------------------------*/
(0501, 05, '24/7/2022'),
(0502, 05, '22/7/2022'),
(0503, 05, '22/7/2022'),
(0504, 05, '25/7/2022'),
(0505, 05, '24/7/2022'),
(0506, 05, '23/7/2022'),
(0507, 05, '26/7/2022'),
(0508, 05, '24/7/2022'),
(0509, 05, '25/7/2022'),
(0510, 05, '26/7/2022');
/*-------------------------------------------------------------------------------------*/

INSERT INTO teacher_experience (past_experience, teacherID )
 VALUES
 ('english language', 78654),
 ('Active learning', 67342),
 ('Communication with child', 33542),
 ('english language', 67304),
 ('Active learning', 21456),
 ('Communication with child',  83401),
 ('english language', 45698),
 ('Active learning',  35698),
 ('Communication with child', 10128),
 ('english language', 22517);
 
 INSERT INTO teacher_qualifications (qualifications, teacherID )
 VALUES
 ('Bachelors', 78654),
 ('Bachelors', 67342),
 ('Master', 33542),
 ('Bachelors', 33542),
 ('doctor', 67304),
 ('Master', 67304),
 ('Bachelors', 67304),
 ('Master', 21456),
 ('Bachelors', 21456),
 ('Bachelors', 83401),
 ('doctor', 45698),
 ('Mastere', 45698),
 ('Bachelors', 45698),
 ('Bachelors', 35698),
 ('Master', 10128),
 ('Bachelors', 10128),
 ('Bachelors', 22517);
 INSERT INTO teacher_phone ( phone_number, teacherID )
 VALUES
 (0555794280, 78654),
 (0509614942, 78654),
 (0509662891, 67342),
 (0534260238, 67342),
 (0506773411, 33542),
 (0598690227, 33542),
 (0509236511, 67304),
 (0559815642, 21456),
 (0505573691, 83401),
 (0504430136, 45698),
 (0555792654, 35698),
 (0578235102, 10128),
 (0507364899, 10128),
 (0501589233, 22517);
 
 INSERT INTO teacher_work ( DOE, teacherID )
 VALUES
('22/7/2020',  78654),
('16/6/2021',  67342),
('5/4/2019',   33542),
('10/3/2020', 67304),
('8/10/2022',  21456),
('24/1/2021',  83401),
('13/5/2019',  45698),
('20/3/2021', 35698),
('6/9/2019 ', 10128),
('28/4/2022',  22517);

INSERT INTO admin (name, adminID, task, supervisor)
VALUES
('Ahlam', 11248, 'communication with parents', 12345),
('Hanen', 11105, 'Staff management', 12345),
('Abeer', 12114, 'Attendance', 12345),
('Shahed', 18723, 'Safety and Security', 12345),
('Dania', 10111, 'Organizing events and trips', 12345);

INSERT INTO admin_phone (adminID , phoneNumber)
VALUES
(11248, 0541238711),
(11105, 0555532892),
(12114, 0553334321),
(18723, 0594430139),
(18723, 0507184472),
(10111, 0509661245),
(10111, 0534260238);

INSERT INTO admin_work (adminID, DOE )
VALUES
(11248, '12/4/2020'),
(11105, '14/7/2021'),
(12114, '7/6/2019'),
(18723, '5/5/2022'),
(10111, '6/2/2020');

#~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~~-~-~-~-~-
#update and delete 
DELETE FROM admin_phone 
WHERE adminID=10111 AND phonenumber =534260238;

SET SQL_SAFE_UPDATES = 0;

UPDATE principal_phone
SET principal_phone.phoneNumber = 0509614942
WHERE principal_phone.phoneNumber =581060995;

#~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~~-~-~-~-~-
# 10 Quruies:

#num1 counting number of Boys and Girls in the kindergarden
SELECT child.gender, count(*) AS Number
FROM child
GROUP BY gender;

#num2 query for a specific class and presenting each name and id for children in the class
SELECT C.childID AS ID , concat(C.name," ",C.guardian_name) AS Name , C.gender 
FROM child AS C
INNER JOIN attending AS A ON c.childID = A.childID
WHERE classID = (SELECT classID FROM class
				WHERE name_of_class = 'butterflies')
ORDER BY ID ASC;

#num3 presenting each of class , main teacher and assistant teacher
select classID ,name_of_class, mainTeacher AS TeacherID,assistantTeacher AS AssistantTeacherID
from class
group by classID
having (classID) >= 1
order by classID;

#num4 finding which admin was responsible for orgnizing events and trips
SELECT admin.name AS 'Admin Name'
FROM admin
WHERE admin.task = "Organizing events and trips";

#num5 getting all information about a  assistant teacher who assist in spasefic class (flowers)
SELECT * 
FROM teacher 
WHERE teacherID IN (SELECT assistantTeacher
					FROM class 
                    WHERE name_of_class = "flowers");
                    
#num6 getting information about classes that have the maximum number of children 
select  distinct name_of_class , num_of_children
from class
where num_of_children = (select max(num_of_children) from class)
group by classID;

#num7 Find the number of repetitions of Jobs between guardians AND order from the most to the least
SELECT guardian_employment.job , count(*) AS frequancy
FROM guardian_employment
WHERE employeed NOT LIKE 'NO'
GROUP BY job
ORDER BY frequancy DESC ;

#num8 A list of guardians who have an income that exceeds 5000
SELECT name , job , income
FROM guardian_employment
where employeed ="Yes" AND income >=5000;

#num9 presenting full information about a specific child 
SELECT *
FROM child
where name = "Layan"
having childID = "509";

#num10 presenting children who have an allergies
 select name , childID , allergies 
 FROM child
 where allergies NOT IN ("nothing");