***************************************
!!WELCOME TO THE CASE STUDY PRACTICAL!!
***************************************

************
!!CONTENTS!!
************
-README.txt (Instructions - Looks like you found it!)
-Configure.bat (Configuration Setup Script)
-database_initialize_script.sql (Creates Database Tables, Constraints, Triggers, and an Admin Account)
-HomeInsurance_For_Students.zip (Java Project Files)
-apache-tomcat-8.5.34 (Tomcat Server Files)
-CaseStudy.png (Database Table Schema and Entity Relation Diagram)

***************************
!!CHANGES IN THIS VERSION!!
***************************
-Fixed bug in database trigger: did not allow renew of policy
-Added date validation: verifies day and month are valid
-Added data integrity protection on interruption: Any incomplete records are removed on login
-Added Error prevention: all pages redirect to login if not valid entrance
-No Insecured Access - Search User page is off limits
-No duplicate purchases of quote
-Admin links show list of all quotes instead of filling out quote form
-More information links open in new window
-Bug fixes

********************
!!SPECIAL FEATURES!!
********************
-Batch configuration script
-Create Primary Database Administrator in database initialize script
-Thorough project logs (Logs show exactly where failure originates)
-Javadocs (Code is reader-friendly for other developers)
-All errors print messages in language of the system locale
-Corrected Tablenames to convention (plural of stored objects)
-All string values have been encapsulated into HomeInsuranceConstants (eliminates risk of spelling errors)
-3 Levels of data integrity checks (SQL, DAO, JSP)

***********
!!CHANGES!!
***********

DATABASE OPTIMIZATIONS/INTEGRITY
-Reduced Field Sizes To Minimums
-Constraints on Data Throughout
-Multiple-Field Constraints: Used Concatenation To Process Similar Data Formats(Minimize Processing)
-Regular Expression Validators
-Date Trigger Validators
-Fixed Bug Constraint Preventing same day policy cancellations (effectiveDate < endDate became effectiveDate <= endDate)

JAVA APPLICATION OPTIMIZATIONS/CORRECTIONS
-Policy.getDateAfterOneYear() now public and static reference
-Policy Renew - Now changes End Date
-Fixed Admin Website Work Flow - clicking searchUser link after policy change no longer logs out
-DAO Data Validation Before Transaction

JAVA SERVER PAGES
-Validations on All Fields for All Forms
-Input mask for zip, social security, email, etc...
-Date Picker
-Error Alerts Guide User to the Issue
-Regular Expression Validations
-JSP Scriplet hidden Address 2 value when null
-Fixed bug - displayed effective date twice instead of effective and end date (confirmation.jsp)

SERVICE NOW WORKFLOW
-KNOWLEDGE MODULES:
	-KB0010009 : Oracle Article Reference  - All_Tab_Columns
	-KB0010008 : Video Tutorial - Dealing with datatype mismatches (Author: Benjamin Edelstein Password ASM05SECRET)
	-KB0010007 : Video Tutorial - Inserting Blank Values into a database (Author: Benjamin Edelstein Password ASM05SECRET)
	-KB0010005 : Video Tutorial - Using SqlPlus and eclipse to fix a problem (Author: Benjamin Edelstein Password ASM05SECRET)
	-KB0010003 : Video Tutorial - Example of Javascript enable/disable elements (Author: Benjamin Edelstein Password ASM05SECRET)
-INCIDENTS:
	-INC0010042 (Simple1): Customer only sees one quote ==> RESOLVED
	-INC0010043 (Simple2): Checkbox doesn't prevent purchase of policy ==> Knowledge Article  KB0010003 (Video) ==> RESOLVED
	-INC0010044 (Simple3): Customer is unable to choose 'Rental Property' ==> Problem PRB0040023 ==> Related Incidents INC0010023 INC0010012 INC0010028 ==> Knowledge Article KB0010005 (Video) ==> RESOLVED
	-INC0010047 (Simple4): Customer cannot choose exactly 5, 10, or 20 year old homes ==> Problem PRB0040024 ==> RESOLVED

-PROBLEMS/CHANGE-REQUESTS:
	-INC0010048 (Medium1): Customer cannot choose 1.5 or 2.5 story homes ==> Problem PRB0040026 ==> Resolution Ready Pending Approval ==> Knowledge Base KB0010008 ==> Change Request CHG0030014
	-	(Medium2): Unable to view multiple policies
	-INC0010049 (Medium3): Customer gets error when Address Line 2 is blank ==> Resolution Ready Pending Approval ==> Knowledge Base KB0010007 ==> Change Request CHG0030015
	-PRB0040027 (Medium4): Property fields allow unconstrained values ==> Related Incidents INC0010029 ==> Implemented by Beth Anglin ==> RESOLVED
	-PRB0040034 (Medium5): Administrative user not recognized by the system ==> Duplicate Problem PRB0040028 ==> RESOLVED
	-PRB0040068 (Medium6): Bad work flow for Administrative user ==> RESOLVED
	-PRB0040065 (Complex1): Navigation bar missing and some broken links ==> Problem Tasks: PTASK0010010 PTASK0010011 PTASK0010012 PTASK0010013 PTASK0010014 PTASK0010015 PTASK0010016
		PTASK0010017 PTASK0010018 PTASK0010019 PTASK0010020 PTASK0010021 PTASK0010022 PTASK0010023 PTASK0010024 ==> Resolution Ready Pending Approval ==> Change Request CHG0030029
	-PRB0040030 (Complex2): Improve consistency and reduce data errors
	-PRB0040029 (Complex3): Field Validations ==> Problem Tasks PTASK0010001 PTASK0010002 PTASK0010003 PTASK0010004 ==> All Resolutions Ready Pending Approval ==> CHG0030016

*************************
!!SOFTWARE REQUIREMENTS!!
*************************
-Tested on Windows 10 64-bit
-ORACLE DATABASE (Tested on 12c Release 1 Windows 64bit)
	-Should already include SQLPLUS (Required for guided configuration) (Tested on Release 12.2.0.1.0 Production Windows 64bit)
-ECLIPSEJEE (Java Enterprise Edition) (Tested on Photon & SimRel Windows 64bit)
-APACHE TOMCAT (Tested on ver. 8.5.34 Windows 64bit)
-(OPTIONAL)SQL DEVELOPER (Tested on ver. 18.3.0.277.2354-x64 Windows 64bit)

*********
!!SETUP!!
*********
-Follow the Script Guided Setup.
-If the script fails, Follow the Manual Setup.

\\\\\\\\\\\\\\\\\
||SCRIPT GUIDED||
/////////////////

1)Unzip contents of BENJAMIN_EDELSTEIN_ASM_CASESTUDY.zip
2)Setup a Database:
- NOTE: Ensure that the HTTPListener port is NOT 8080 - Tomcat will not run properly otherwise
- Record the port, SID, username, and password for your connection. These are needed for the configuration setup.
3)Configure Properties: Double click the Configure.bat file and follow the prompts
	-It is NORMAL to have ERRORS ON FIRST RUN. The script is dropping tables that do not yet exist.
	-Other Administrators can be added to the database manually using: 
	INSERT INTO LOGINS VALUES (<YOUR_ADMINISTRATOR_USERNAME>, <YOUR_ADMINISTRATOR_PASSWORD>, 'ADMIN');
4)Import Project: In EclipseJEE click File>>import 
- Under General choose 'Existing Projects into Workspace' and click next
- Mark 'Select archive file' and click browse
- Navigate to and select the HomeInsurance_For_Students zip file
- Click open, check that 'HomeInsurance_For_Students' is checked
- Click 'Finish'
5)Setup Tomcat: Extract the contents of the Apache Tomcat zip to a folder somewhere (Recommended: Program Files)
- In EclipseJEE Right Click the project folder
- Click Build Path >> Configure Build Path
- Click Targeted Runtimes - Tomcat v8.5 Should be displayed
- Click New, Select Apache Tomcat v8.5 (or your version)
- Check Create a new local server and click 'Next'
- Name The server whatever you want, and click 'Browse' 
- Navigate to apache tomcat folder you extracted and click 'Select Folder'
- Click 'Finish'
- Click Server from the list on the left side 
- Under 'Always use the following server...' select the Tomcat server you just made.
- Click Apply
6)Check Your Java Libraries: Click Java Build Path from the list on the left
- Click 'Libraries' tab
- If 'JRE System Library[JavaSE-1.8]' has a red 'X' then we must fix it
- If nothing is showing red click 'Apply and Close' and skip to 7
- Click 'JRE System Library[JavaSE-1.8]' with a red 'X', then click 'Edit'
- Mark 'Execution environment' and choose 'JavaSE-1.8 (jre1.8.0_181)' from the dropdown list
- Click Finish
-Click 'Apply and Close'
7)Rebuild Project: Click Menu Project >> Clean... and click clean
8)Click the 'HomeInsurance_For_Students' folder in 'Project Explorer' 
- Click the green play button on the top center to run the project
- Select 'Run on Server' and click 'OK'
- Leave the default values, 'Check Always use this server...'
- Click Finish

Eclipse Browser should open on the Web Application Home Page
Home Page is accessible in any browser on: http://localhost:8080/HomeInsurance_For_Students/

\\\\\\\\\\
||MANUAL||
//////////

1)Unzip contents of BENJAMIN_EDELSTEIN_ASM_CASESTUDY.zip
2)Setup a Database 
- NOTE: Ensure that the HTTPListener port is NOT 8080 - Tomcat will not run properly otherwise
- Record the port, SID, username, and password for your connection
3)Run database_initialize_script.sql on your database connection
--This can be run in SQL Developer, or SQLPLUS
-- Will prompt for primary database administrator Username & Password
-- Other Administrators can be inserted manually into the database with the following:
	--INSERT INTO LOGINS VALUES (<YOUR_ADMINISTRATOR_USERNAME>, <YOUR_ADMINISTRATOR_PASSWORD>, 'ADMIN');
4)Import Project: In EclipseJEE click File>>import 
- Under General choose 'Existing Projects into Workspace' and click next
- Mark 'Select archive file' and click browse, navigate to the extracted folder
- Click the project zip: HomeInsurance_For_Students.zip
- Click open, check that 'HomeInsurance_For_Students' is checked and click 'Finish'
5)Setup Tomcat: Extract the contents of the Apache Tomcat zip to a folder somewhere (Recommended: Program Files)
- In EclipseJEE Right Click the project folder
- Click Build Path >> Configure Build Path
- Click Targeted Runtimes - Tomcat v8.5 Should be displayed
- Click New, Select Apache Tomcat v8.5 (or your version)
- Check Create a new local server and click 'Next'
- Name The server whatever you want, and click 'Browse' 
- Navigate to apache tomcat folder you extracted and click 'Select Folder'
- Click 'Finish'
- Click Sever from the list on the left side 
- Under 'Always use the following server...' select the Tomcat server you just made.
- Click Apply
6)Check Your Java Libraries: Click Java Build Path from the list on the left
- Click 'Libraries' tab
- If 'JRE System Library[JavaSE-1.8]' has a red 'X' then we must fix it
- If nothing is showing red click 'Apply and Close' and skip to 7
- Click 'JRE System Library[JavaSE-1.8]' with a red 'X', then click 'Edit'
- Mark 'Execution environment' and choose 'JavaSE-1.8 (jre1.8.0_181)' from the dropdown list
- Click Finish
-Click 'Apply and Close'
7)Open the 'db.properties' file in 'Java Resources' >> src >> com.cts.insurance.homequote.resources
- Modify port and SID in the url to match your database - jdbc:oracle:thin:@localhost:<PORT>:<SID>
- Substitute username and password
8)Open the 'log4j.properties' file in 'WebContent' >> 'WEB-INF'
- Change value for 'log4j.appender.File.File' to a location path for the log file --be sure to include filename on the end of the path'homequote.log'
9)Rebuild Project: Click Menu Project >> Clean... and click clean
10)Click the 'HomeInsurance_For_Students' folder in 'Project Explorer' 
- Click the green play button on the top center to run the project
- Select 'Run on Server' and click 'OK'
- Mark 'Manually define a new server', select 'Tomcat v8.5 Server'
- Leave the fields as they are and check 'Always use this server when running this project'
- Click 'Finish' Eclipse Browser should open on the Web Application Home Page
- Home Page is accessible in any browser on: http://localhost:8080/HomeInsurance_For_Students/

*************************
!!DATABASE TABLE SCHEMA!!
*************************

TABLE: LOGINS
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 USER_NAME                                 NOT NULL VARCHAR2(19 CHAR)
 USER_PWD                                  NOT NULL VARCHAR2(19 CHAR)
 ADMIN_ROLE                                NOT NULL VARCHAR2(5 CHAR)

TABLE: LOCATIONS
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 QUOTE_ID                                  NOT NULL NUMBER(38)
 RESIDENCE_TYPE                            NOT NULL VARCHAR2(18 CHAR)
 ADDRESS_LINE_1                            NOT NULL NVARCHAR2(49)
 ADDRESS_LINE_2                                     NVARCHAR2(99)
 CITY                                      NOT NULL VARCHAR2(14 CHAR)
 STATE                                     NOT NULL VARCHAR2(14 CHAR)
 ZIP                                       NOT NULL VARCHAR2(9 CHAR)
 RESIDENCE_USE                             NOT NULL VARCHAR2(15 CHAR)
 USER_NAME                                 NOT NULL VARCHAR2(19 CHAR)

TABLE: HOMEOWNERINFOS
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 QUOTE_ID                                  NOT NULL NUMBER(38)
 FIRST_NAME                                NOT NULL VARCHAR2(30 CHAR)
 LAST_NAME                                 NOT NULL VARCHAR2(30 CHAR)
 DOB                                       NOT NULL CHAR(10 CHAR)
 IS_RETIRED                                NOT NULL VARCHAR2(3 CHAR)
 SSN                                       NOT NULL VARCHAR2(9 CHAR)
 EMAIL_ADDRESS                             NOT NULL VARCHAR2(50 CHAR)

TABLE: PROPERTIES
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 QUOTE_ID                                  NOT NULL NUMBER(38)
 MARKET_VALUE                              NOT NULL NUMBER(8)
 YEAR_BUILT                                NOT NULL NUMBER(4)
 SQUARE_FOOTAGE                            NOT NULL NUMBER(4)
 DWELLING_STYLE                            NOT NULL NUMBER(2,1)
 ROOF_MATERIAL                             NOT NULL VARCHAR2(8 CHAR)
 GARAGE_TYPE                               NOT NULL VARCHAR2(8 CHAR)
 NUM_FULL_BATHS                            NOT NULL NUMBER(1)
 NUM_HALF_BATHS                            NOT NULL NUMBER(1)
 HAS_SWIMMING_POOL                         NOT NULL VARCHAR2(5 CHAR)

TABLE: QUOTES
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 QUOTE_ID                                  NOT NULL NUMBER(38)
 PREMIUM                                   NOT NULL NUMBER(10,2)
 DWELLING_COVERAGE                         NOT NULL NUMBER(10,2)
 DETACHED_STRUCTURE                        NOT NULL NUMBER(10,2)
 PERSONAL_PROPERTY                         NOT NULL NUMBER(10,2)
 ADDNL_LIVING_EXPENSE                      NOT NULL NUMBER(10,2)
 MEDICAL_EXPENSE                           NOT NULL NUMBER(10,2)
 DEDUCTIBLE                                NOT NULL NUMBER(10,2)

TABLE: POLICIES
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 POLICY_KEY                                NOT NULL VARCHAR2(10 CHAR)
 QUOTE_ID                                  NOT NULL NUMBER(38)
 POLICY_EFFECTIVE_DATE                     NOT NULL VARCHAR2(10 CHAR)
 POLICY_END_DATE                           NOT NULL VARCHAR2(10 CHAR)
 POLICY_TERM                               NOT NULL VARCHAR2(3 CHAR)
 POLICY_STATUS                             NOT NULL VARCHAR2(9 CHAR)

TRIGGERS:
-HOMEOWNERINFOS_DOB_CK
-PROPERTIES_YEAR_BUILT_CK
-POLICIES_DATE_CK