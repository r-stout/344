-- Tables for 344 Project

/* DROP STATEMENTS */
DROP TABLE per CASCADE CONSTRAINTS;
DROP TABLE dem CASCADE CONSTRAINTS;
DROP TABLE email CASCADE CONSTRAINTS;
DROP TABLE hos CASCADE CONSTRAINTS;
DROP TABLE stu CASCADE CONSTRAINTS;
DROP TABLE par CASCADE CONSTRAINTS;
DROP TABLE phn CASCADE CONSTRAINTS;
DROP TABLE emg CASCADE CONSTRAINTS;
DROP TABLE inc CASCADE CONSTRAINTS;
DROP TABLE medin CASCADE CONSTRAINTS;
DROP TABLE addr CASCADE CONSTRAINTS;
DROP TABLE brn CASCADE CONSTRAINTS;
DROP TABLE stdoc CASCADE CONSTRAINTS;
DROP TABLE sdev CASCADE CONSTRAINTS;
DROP TABLE serv CASCADE CONSTRAINTS;
DROP TABLE ori CASCADE CONSTRAINTS;
DROP TABLE data CASCADE CONSTRAINTS;
DROP TABLE off CASCADE CONSTRAINTS;
DROP TABLE econ CASCADE CONSTRAINTS;
DROP TABLE pro CASCADE CONSTRAINTS:

/* CREATE STATEMENTS */

--PERSON TABLE
CREATE TABLE per (
perID NUMBER (10),
perfname VARCHAR2(35) NOT NULL,
perlname VARCHAR2(35) NOT NULL,
permname VARCHAR2 (35),--NULLABLE BECAUSE SOME MIGHT NOT LIST A MIDDLE NAME. 

CONSTRAINT per_perID_pk PRIMARY KEY(perID));
  
--DEMOGRAPHIC TABLE  
CREATE TABLE dem (
stuID NUMBER (10),
demgen VARCHAR2 (1) NOT NULL, -- GENDER
demdob  DATE NOT NULL, 

CONSTRAINT dem_stuID_pk PRIMARY KEY (stuID),
CONSTRAINT dem_stuID_fk FOREIGN KEY (stuID) REFERENCES per (perID));

--EMAIL TABLE ---- FIX THIS, WE NEED TO ADD PERSON ID
CREATE TABLE email (
emailID NUMBER (10),
emailus VARCHAR2 (20) NOT NULL,
emaildom VARCHAR2 (20)NOT NULL,
  
CONSTRAINT email_emailID_pk PRIMARY KEY (emailID),
CONSTRAINT email_emailID_fk FOREIGN KEY (emailID) REFERENCES per (perID));

--HOSPITAL TABLE
CREATE TABLE hos (
stuID NUMBER (10),
orgID NUMBER (10),
hospref VARCHAR2 (1) NOT NULL, --PREFERENCE (P/S) 
hosphn NUMBER (10) NOT NULL, --PHONE NUMBER  

CONSTRAINT hos_pk PRIMARY KEY (stuID, orgID),  
CONSTRAINT hos_stuID_fk FOREIGN KEY (stuID) REFERENCES per (perID),
CONSTRAINT hos_orgID_fk FOREIGN KEY (orgID) REFERENCES org (orgID),
CONSTRAINT hospref_cc CHECK (hospref = 'P';) OR (hospref = 'S'));
  
-- STUDENT TABLE
CREATE TABLE stu (
perID NUMBER (10),
orgID NUMBER (10), --ORGANIZATON ID
stulunch VARCHAR2 (1) NOT NULL, -- LUNCH (Y/N)
stuyr VARCHAR2 (35) NOT NULL, -- YEAR IN SCHOOL (JUNIOR, SENIOR, ETC)  
sturet VARCHAR2 (1) NOT NULL,   -- RETAINED (Y/N)
stutru VARCHAR2 (1) NOT NULL,   --TRUANCY (Y/N)
stugradecomm VARCHAR2 (35) NOT NULL, --GRADE COMMENTS
stugradesatis VARCHAR2 (1) NOT NULL,  --GRADE SATISFIED (Y/N)
stuhomewrk VARCHAR2 (35) NOT NULL,  --HOMEWORK
stuservice VARCHA2 (35) NOT NULL,--(Y/N)
  
CONSTRAINT stu_perID_pk PRIMARY KEY (perID, orgID),
CONSTRAINT stu_perID_fk FOREIGN KEY (perID) REFERENCES per (perID),
CONSTRAINT stu_orgID_fk FOREIGN KEY (orgID) REFERENCES org (orgID),
CONSTRAINT stulunch_cc CHECK (stulunch = 'Y') OR (stulunch = 'N'),
CONSTRAINT sturet_cc CHECK (sturet = 'Y') OR (sturet = 'N'), 
CONSTRAINT stutru_cc CHECK (stutru = 'Y') OR (stutru = 'N'), 
CONSTRAINT stugradesatis_cc CHECK (stugradesatis = 'Y') OR (stugradesatis = 'N'), 
CONSTRAINT stuservice_cc CHECK (stuservice = 'Y') OR (stuservice = 'N')); 

-- EMERGENCY CONTACT TABLE
CREATE TABLE par (
stuID NUMBER (10),
emgID NUMBER (10) NOT NULL, --EMERGENCY ID
parrelation VARCHAR2 (35) NOT NULL,--RELATION TO STUDENT
emgcall CHAR (1) NOT NULL, --CALL IN CASE OF EMERGENCY (Y/N)
authpick CHAR (1) NOT NULL, --AUTHORIZE PICK UP (Y/N)
notauth CHAR (1) NOT NULL, -- NOT AUTHORIZED TO PICK UP (Y/N)

CONSTRAINT par_pk PRIMARY KEY(stuID, emgID),
CONSTRAINT par_stuID_fk FOREIGN KEY (stuID) REFERENCES per (perID),
CONSTRAINT par_emgID_fk FOREIGN KEY (emgID) REFERENCES per (perID),
CONSTRAINT emgcall_cc CHECK (emgcall = 'Y') OR (emgcall - 'N'),
CONSTRAINT authpick_cc CHECK (authpick = 'Y') OR (emgcall = 'N'), 
CONSTRAINT notauth_cc CHECK (notauth = 'Y') OR (notauth = 'N'));  
  
-- PHONE TABLE  
CREATE TABLE phn (
phnID VARCHAR2 (35) NOT NULL,
phntype VARCHAR2 (1) NOT NULL, -- PRIMARY OR SECONDARY 
phncntry NUMBER (1) NOT NULL,
phnarea NUMBER (1) NOT NULL,
phnexc NUMBER (35) NOT NULL,
perID NUMBER (10) NOT NULL, 

CONSTRAINT phn_phnID_pk PRIMARY KEY(phnID),
CONSTRAINT perID_fk FOREIGN KEY (perID) REFERENCES per (perID),
CONSTRAINT phntype_cc CHECK (phntype = 'P') OR (phntype = 'S')) ;

-- SPECIAL SERVICES TABLE
CREATE TABLE serv (
stuID NUMBER (10), 
speech CHAR (1) NOT NULL, 
ell CHAR (1) NOT NULL, 
title1 CHAR (1) NOT NULL, 
cogdis CHAR(1) NOT NULL, 
lerndis CHAR (1) NOT NULL, 
emobeh CHAR (1) NOT NULL, 
other CHAR (1) NOT NULL, 
CONSTRAINT serv_stuID_pk PRIMARY KEY (stuID), 
COSTRAINT serv_stuID_fk FOREIGN KEY (stuID) REFERENCES per (perID), 
  CONSTRAINT speech_cc CHECK (speech = 'Y') OR (speech = 'N'), 
  CONSTRAINT ell_cc CHECK (ell = 'Y') OR (ell = 'N'), 
  CONSTRAINT  title1_cc CHECK (title1 = 'Y') OR (title1 = 'N'), 
  CONSTRAINT cogdis_cc CHECK (cogdis = 'Y') OR (cogdis = 'N'), 
  CONSTRAINT lerndis_cc CHECK (lerndis = 'Y') OR (lerndis = 'N'), 
  CONSTRAINT emobeh_cc CHECK (emobeh = 'Y') OR (emobeh = 'N'), 
  CONSTRAINT other _cc CHECK (other  = 'Y') OR (other  = 'N')); 
  
--Income Table
CREATE TABLE inc (
perID NUMBER (10),  
incfamsi NUMBER (10) NOT NULL,  --FAMILY SIZE
incinc NUMBER (10) NOT NULL, --   FAMILY INCOME
incmili VARCHAR2 (1) NOT NULL,  --MILITARY STATUS (Y/N)
  
CONSTRAINT inc_pk PRIMARY KEY(perID),
CONSTRAINT inc_perID_fk FOREIGN KEY (perID) REFERENCES per(perID),  
CONSTRAINT incmili_cc CHECK (incmili = 'Y') OR (incmili = 'N'));  
  
--MEDICAL INFO TABLE
CREATE TABLE medinfo (
stuID NUMBER (10),
medindate DATE, -- DATE OF LAST VISIT
medinupda VARCHAR2 (1), --IMMUNIZATION UPDATE (Y/N) 
medcouns  CHAR (1), --COUNSELING (Y/N)
  
CONSTRAINT medin_stuID_pk PRIMARY KEY (stuID),  
CONSTRAINT medin_stuID_fk FOREIGN KEY (stuID) REFERENCES per (perID),
CONSTRAINT medcouns_cc CHECK (medcouns = 'Y') OR (medcouns - 'N'));  
  
  
-- ADDRESS TABLE   
CREATE TABLE addr (
addrID NUMBER (10),
addrstreet VARCHAR2 (35) NOT NULL,
addrcity VARCHAR2 (35) NOT NULL, 
addrst   CHAR (2) NOT NULL,
addrzip NUMBER (5) NOT NULL,  
  
CONSTRAINT addr_addrID_pk PRIMARY KEY (addrID)) ;  
                                       
--PERSONAL ADDRESS TABLE 
CREATE TABLE peraddr (                                       
perID NUMBER (10),                                       
addrID NUMBER (10),
addtype CHAR (1) NOT NULL, -- primary or secondary 
CONSTRAINT peraddr_pk PRIMARY KEY (perID, addrID), 
CONSTRAINT perID_fk FOREIGN KEY (perID) REFERENCES per (perID), 
CONSTRAINT addrID_fk FOREIGN KEY (addrID) REFERENCES addr (addrID),
CONSTRAINT addtype_cc CHECK (addtype = 'P') OR (addtype = 'S'));

--MILITARY BRANCH TABLE
CREATE TABLE brn (
perID NUMBER (10),
brnname VARCHAR2(35) NOT NULL,
  
CONSTRAINT brn_perID_pk PRIMARY KEY (perID));  

--STUDENT DOCTOR TABLE
CREATE TABLE stdoc (
stuID NUMBER (10),
docID NUMBER (10),
 
CONSTRAINT stdoc_pk PRIMARY KEY (stuID, docID)
CONSTRAINT stdoc_stuID_fk FOREIGN KEY (stuID) REFERENCES per (perID)
CONSTRAINT stdoc_docID_fk FOREIGN KEY (docID) REFERENCES per (perID));
  
--SOCIAL DEVELOPMENT TABLE 
CREATE TABLE sdev (
stuID NUMBER (10),
sdevstress VARCHAR2 (1) NOT NULL, --STRESS (Y/N?)
sdevdral VARCHAR2 (1) NOT NULL, --DRUG AL PROBLEMS IN FAMILY (Y/N?)
sdevleg VARCHAR2 (1) NOT NULL, --LEGAL ISSUES (Y/N)
sdevbull VARCHAR2 (1) NOT NULL, --BULLYING ISSUES (Y/N)

CONSTRAINT sdev_stuID_pk PRIMARY KEY (stuID),
CONSTRIANT sdev_stuID_fk FOREIGN KEY (stuID) REFERENCES per (perID)
CONSTRAINT sdevstress_cc CHECK (sdevstress = 'Y') OR (sdevstress = 'N'),
CONSTRAINT sdevdral_cc CHECK (sdevdral = 'Y'), OR (sdevdral = 'N'),
CONSTRAINT sdevleg_cc CHECK (sdevleg = 'Y') OR (sdevleg = 'N')
CONSTRAINT sdevbull_cc CHECK (sdevbull = 'Y') OR (sdevbull = 'N'));
  
--MEMBERSHIP RELEASE FORM TABLE
CREATE TABLE mr (
stuID NUMBER (10),
mrdatsig DATE NOT NULL,     --DATE SIGNED
mrliab VARCHAR2 (1)NOT NULL, --LIABILITY Y/N
mrtrans VARCHAR2 (1)NOT NULL, --TRANSPORTATION
mrpho VARCHAR2 (1) NOT NULL, --PHOTO/VIDEO Y/N
mracadem VARCHAR2 (1) NOT NULL, -- ACADEMIC INFO RELEASE Y/N
mrcomp VARCHAR2 (1) NOT NULL, -- COMPUTER USE Y/N   
mrauthl VARCHAR2 (1) NOT NULL, -- AUTHORIZED TO LEAVE Y/N
mrmemsig VARCHAR2 (1) NOT NULL -- MEMBER SIGNATURE Y/N
mrparsig VARCHAR2 (1) NOT NULL, --PARENT SIGNATURE Y/N
mrelect VARCHAR2 (1) NOT NULL, -- ELECTRONICS Y/N
  
CONSTRAINT mr_pk PRIMARY KEY (stuID),
CONSTRAINT mr_fk FOREIGN KEY (stuID) REFERENCES per (perID),
CONSTRAINT mrdatsig_cc CHECK (mrdatsig = 'Y') OR (mrdatsig = 'Y');   
CONSTRAINT mrliab_cc CHECK (mrliab = 'Y') OR (mrliab = 'Y'),  
CONSTRAINT mrtrans_cc CHECK (mrtrans= 'Y') OR (mrtrans = 'Y'),
CONSTRAINT mrpho_cc CHECK (mrpho = 'Y') OR (mrpho = 'Y'),
CONSTRAINT mracadem_cc CHECK (mracadem = 'Y') OR (mracadem = 'Y'),
CONSTRAINT mrcomp_cc CHECK (mrcomp = 'Y') OR (mrcomp = 'Y'),
CONSTRAINT mrmemsig_cc CHECK (mrmemsig = 'Y') OR (mrmemsig = 'Y'),
CONSTRAINT mrparsig_cc CHECK (mrparsig = 'Y') OR (mrparsig = 'Y'),
CONSTRAINT mrelect _cc CHECK (mrelect  = 'Y') OR (mrelect  = 'Y'));

 
--OFFICE USE TABLE
CREATE TABLE off
empID NUMBER (10), -- EMPLOYEE ID
stuID NUMBER (10),  -- STUDENT ID
offmemst VARCHAR2 (1) NOT NULL, --CHECK THIS MEMBER STATUS (GUEST, NEW, RENEW)  
offpay VARCHAR2(35) NOT NULL, -- PAYMENT METHOD (PAID, CASH, CHECK, MO, SCHOLARSHIP)
offpaya NUMBER(10) NOT NULL, --PAYMENT AMOUNT 
  
CONSTRAINT off_pk PRIMARY KEY (empID, stuID),
CONSTRIANT off_empID_fk FOREIGN KEY (empID) REFERENCES per (perID),
CONSTRIANT off_stuID_fk FOREIGN KEY (stuID) REFERENCES per (perID),
CONSTRAINT offmemst_cc CHECK (offmemst = 'Guest') OR (offmemst = 'New') OR (offmemst = 'Renew'));  
  
--DATA ENTRY TABLE
CREATE TABLE data (
empID NUMBER (10), -- EMPLOYEE ID
stuID NUMBER (10),  -- STUDENT ID
datadatr DATE NOT NULL, -- DATE RECEIVED
datadate DATE NOT NULL, -- DATE ENTERED 
  
CONSTRAINT off_pk PRIMARY KEY (empID, stuID),
CONSTRIANT off_empID_fk FOREIGN KEY (empID) REFERENCES per (perID),
CONSTRIANT off_stuID_fk FOREIGN KEY (stuID) REFERENCES per(perID));    
  
--ORIENTATION TABLE
CREATE TABLE ori (  
empID NUMBER (10),
stuID NUMBER (10), 
orida DATE NOT NULL, --ORIENTATION DATE
oriti DATE NOT NULL, --ORIENTATION TIME
oricom VARCHAR2 (1) NOT NULL, --ORIENTATION COMPLETE (Y/N)
  
CONSTRAINT ori_pk PRIMARY KEY (empID, stuID)
CONSTRIANT ori_empID_fk FOREIGN KEY (empID) REFERENCES per (perID),
CONSTRIANT ori_stuID_fk FOREIGN KEY (stuID) REFERENCES per (perID)
CONSTRAINT oricom_cc CHECK (oricom = 'Y') OR (oricom = 'N'));    
  
--PLACE OF EMPLOYMENT TABLE
CREATE TABLE plofemp (
perID NUMBER (10),
orgID NUMBER (10), 

CONSTRAINT plofemp_perID_pk PRIMARY KEY(perID, orgID),
CONSTRAINT plofemp_perID_fk FOREIGN KEY (perID) REFERENCES per(perID), 
CONSTRAINT plofemp_orgID_fk FOREIGN KEY (orgID) REFERENCES org (orgID));
  
-- ORG TABLE 
                                                                
CREATE TABLE org ( 
orgID NUMBER (10), 
orgname VARCHAR2 (35) NOT NULL,
  
CONSTRAINT org_orgID_pk PRIMARY KEY (orgID));
                                                                
                                                                
--Attendance Table
CREATE TABLE att (
stuID NUMBER (10),
attdate DATE NOT NULL, --ATTENDANCE DATE
attchkin DATE NOT NULL, --CHECK IN
attchko DATE NOT NULL, --CHECK OUT
  
CONSTRAINT att_stuID_pk PRIMARY KEY (stuID),  
CONSTRIANT att_stuID_fk FOREIGN KEY (stuID) REFERENCES per (perID)); 


--SPECIAL INSTRUCTIONS TABLE
CREATE TABLE inst (
stuID NUMBER (10),
medID NUMBER (10),
instdesc VARCHAR2 (35) NOT NULL, --DESCRIPTION  
  
CONSTRAINT inst_pk PRIMARY KEY (stuID, medID)  
CONSTRAINT inst_stuID_fk FOREIGN KEY (stuID) REFERENCES per (perID)
CONSTRAINT inst_medID_fk FOREIGN KEY (medID) REFERENCES per (perID));

--MEDICATION TABLE
CREATE TABLE med (
medID NUMBER (10),
hosname VARCHAR2 (10)NOT NULL, --name
medamt NUMBER (10) NOT NULL, --amount 
meddir VARCHAR2 (35) NOT NULL, --HOW TO TAKE (MOUTH, EYE DROPS, EAR, ON SKIN, ETC)
medti DATE NOT NULL, -- TIME/S OF DAY
medre VARCHAR2 (35) NOT NULL, -- REASON
  
CONSTRAINT med_medID_pk PRIMARY KEY (medID)); 

-- Personal Medication table: WE NEED TO ADD THIS TO OUR ERD
CREATE TABLE permed (
medID NUMBER (10), 
perID NUMBER (10), 

CONSTRAINT permed_pk PRIMARY KEY (medID, perID), 
CONSTRAINT medID_fk FOREIGN KEY (medID) REFERENCES med (medID), 
CONSTRAINT perID_fk FOREIGN KEY (perID) REFERENCES per (perID));

                                     
--PROBLEM TABLE
CREATE TABLE pro (
proID NUMBER (10),
stuID NUMBER (10)  NOT NULL,
probtype VARCHAR2 (35) NOT NULL
prospec VARCHAR2 (35) NOT NULL, 
probdate DATE (35) NOT NULL, 
  
CONSTRAINT pro_pk PRIMARY KEY (proID)
CONSTRAINT pro_stuID_fk FOREIGN KEY (stuID) REFERENCES per (perID));

 -- PARENT/GUARDIAN CONSENT FORM
                                                            
  CREATE TABLE parguar ( 
   stuID NUMBER (10), 
   par  VARCHAR2 (35) NOT NULL, 
   parID NUMBER (10) NOT NULL, 
   
    CONSTRAINT parguar_stuID_pk PRIMARY KEY (stuID), 
    CONSTRAINT parguar_stuID_fk FOREIGN KEY (stuID) REFERENCES per (perID), 
    CONSTRAINT parID_fk FOREIGN KEY (parID) REFERENCES per (perID));
                                          
--ETHNICITY TABLE 
                                                            
CREATE TABLE ethnic ( 
  stuID NUMBER (10), 
  caucas CHAR (1) NOT NULL, 
  afamer CHAR (1) NOT NULL, 
  afind   CHAR (1) NOT NULL, 
  asipac  CHAR (1) NOT NULL, 
  hislat  CHAR (1) NOT NULL, 
  multeth CHAR (1) NOT NULL, 
  other CHAR (1) NOT NULL, 
  
  CONSTRAINT ethnic_stuID_pk PRIMARY KEY (stuID), 
  CONSTRAINT ethnic_stuID_fk FOREIGN KEY (stuID) REFERENCES per (perID), 
  CONSTRAINT caucas_cc CHECK (caucas = 'Y') OR (caucas = 'N'), 
  CONSTRAINT afamer_cc CHECK (afamer = 'Y') OR (afamer = 'N'), 
  CONSTRAINT afind_cc CHECK (afind = 'Y') OR (afind = 'N'), 
  CONSTRAINT asipac_cc CHECK (asipac = 'Y') OR (asipac = 'N'), 
  CONSTRAINT hislat_cc CHECK (hislat = 'Y') OR (hislat = 'N'), 
  CONSTRAINT multeth_cc CHECK (multeth = 'Y') OR (multeth = 'N'), 
  CONSTRAINT other _cc CHECK (other  = 'Y') OR (other  = 'N')); 
  
--INSERT STATEMENTS

INSERT INTO per 
  VALUES (3000000001, 'Noah', 'Wetzel','James');
  
INSERT INTO per 
  VALUES (3000000002, 'Jordan', 'Jansen','Fredrick'); 
  
INSERT INTO per 
  VALUES (3000000003, 'Ian', 'Wetzel','Charles');
  
INSERT INTO per 
  VALUES (3000000004, 'Justin', 'Lorentz','Allen');  
  
INSERT INTO per 
  VALUES (3000000005, 'Rachel', 'Stout','Marie');
  
INSERT INTO per 
  VALUES (3000000006, 'Erin', 'Wetzel','Charlene');

INSERT INTO per 
  VALUES (3000000007, 'Sunny', 'Chen',' ');
  
INSERT INTO per 
  VALUES (3000000008, 'Jacob', 'Maurer','Peter');
  
--DEMOGRAPHIC 

INSERT INTO dem
  VALUES (3000000001, 'M', 16-OCT-1996);
  
INSERT INTO dem
  VALUES (3000000002, 'M', 01-JAN-1950);
  
INSERT INTO dem
  VALUES (3000000003, 'M', 20-APR-1994);
  
INSERT INTO dem
  VALUES (3000000004, 'M', 25-APR-1997);  
  
INSERT INTO dem
  VALUES (3000000005, 'F', 15-JUN-1997);  
  
INSERT INTO dem
  VALUES (3000000006, 'F', 30-SEP-1998);
  
 INSERT INTO dem
  VALUES (3000000007, 'F', 25-APR-1997); -- check date
  
INSERT INTO dem
  VALUES (3000000008, 'M', 28-JUN-1997); 
  
  
--EMAIL  
INSERT INTO email
  VALUES ('WETZELNJ5708@uwec.edu', 'WETZELNJ5708', 'uwec.edu');
  
INSERT INTO email
  VALUES ('jordan@uwec.edu', 'j', 'uwec.edu'); --
  
INSERT INTO email
  VALUES ('ianwtz@gmail.com', 'ianwtz', 'gmail.com');
  
INSERT INTO email
  VALUES ('LORENTJA6352@uwec.edu', 'LORENTJA6352', 'uwec.edu');  
  
INSERT INTO email
  VALUES ('rachel@uwec.edu', 'r', 'uwec.edu');     --
  
INSERT INTO email
  VALUES ('erin123@gmail.com', 'erin123', 'gmail.com');
  
INSERT INTO email
  VALUES ('sunny@uwec.edu', 's', 'uwec.edu');
  
INSERT INTO email
  VALUES ('jake@uwec.edu', 'jake', 'uwec.edu');  --
  
--PHONE DO WE NEED TO ADD PERSON ID?? 

INSERT INTO phn
  VALUES ('10001', 'C', '1', '920', '8583994', 3000000001); --Fix data type in create table
  
INSERT INTO phn
  VALUES ('10002', 'C', '1', '715', '7652134',3000000002);  
  
INSERT INTO phn
  VALUES ('10003', 'C', '1', '920', '4562177',3000000003);  
  
INSERT INTO phn
  VALUES ('10004', 'W', '1', '414', '8865432',3000000004); 
  
INSERT INTO phn
  VALUES ('10005', 'C', '1', '952', '7775544',3000000005); 
  
INSERT INTO phn
  VALUES ('10006', 'W', '1', '920', '3435612',3000000006); 
  
INSERT INTO phn
  VALUES ('10007', 'C', '1', '920', '8583994',3000000007); 
  
INSERT INTO phn
  VALUES ('10008', 'C', '1', '715', '7785656',3000000008); 
  
  
