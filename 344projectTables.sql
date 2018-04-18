-- Tables for 344 Project

/* DROP STATEMENTS */

/* CREATE STATEMENTS */

--PERSON TABLE
CREATE TABLE per (
perID VARCHAR2(35),
perfname VARCHAR2(35),
perlname VARCHAR2(35),
permname VARCHAR2 (35),
pergen VARCHAR2 (1),

CONSTRAINT per_perID_pk PRIMARY KEY(perID));
  
--DEMOGRAPHIC TABLE  
CREATE TABLE dem (
demID NUMBER (10),
demeth VARCHAR2 (35)NOT NULL, -- ETHNICITY
demgen VARCHAR2 (1) NOT NULL, -- GENDER

CONSTRAINT dem_demID_pk PRIMARY KEY (demID)
CONSTRAINT dem_demID_fk FOREIGN KEY (demID) REFERENCES dem(demID));
--EMAIL TABLE
CREATE TABLE email (
emailID NUMBER (10),
emailus VARCHAR2 (20) NOT NULL,
emaildom VARCHAR2 (20)NOT NULL,
  
CONSTRAINT email_emailID_pk PRIMARY KEY (emailID)
CONSTRAINT email_emailID_fk FOREIGN KEY (emailID) REFERENCES email(emailID));

--HOSPITAL TABLE
CREATE TABLE hos (
stuID NUMBER (10),
hosID NUMBER (10)NOT NULL,
hosname VARCHAR2 (35) NOT NULL,
hosprim VARCHAR2 (1) NOT NULL, --PRIMARY (Y/N)  
    
-- STUDENT TABLE
CREATE TABLE stu (
perID
stulunch VARCHAR2 (1)
sturet VARCHAR2 (1)
stutru VARCHAR2 (1)
stugradecomm VARCHAR2 (1)
stugradesatis VARCHAR2 (1)
stuhomewrk VARCHAR2 (35)
stuserviceID VARCHA2 (35) --CHECK THIS
  
CONSTRAINT stu_perID_pk PRIMARY KEY(perID),
CONSTRAINT stu_perID_fk FOREIGN KEY (perID) REFERENCES per(perID),
CONSTRAINT stu_servID_fk FOREIGN KEY (servID) REFERENCES serv(servID)); -- MAKE THIS TABLE

-- PARENT TABLE
CREATE TABLE par (
stuID VARCHAR2 (35)
emgcont VARCHAR2 (35)
parempplace VARCHAR2 (35)
parrelation VARCHAR2 (35)
parwrkphn NUMBER (10) --CHECK THIS
 
  
-- PHONE TABLE  
CREATE TABLE phn (
phnID VARCHAR2 (35)
phntype VARCHAR2 (1)
phncntry NUMBER (1)
phnarea NUMBER (1)
phnexc NUMBER (35)

CONSTRAINT phn_phnID_pk PRIMARY KEY(phnID)) ;

-- EMERGENCY TABLE  
CREATE emg (
emgID VARCHAR2 (35)    
emgdesc VARCHAR2 (35)

CONSTRAINT phn_phnID_pk PRIMARY KEY(phnID)) ;
-- SPECIAL SERVICES TABLE
CREATE TABLE serv (
  
--Income Table
CREATE TABLE inc (
perID NUMBER (10),
incfamsi NUMBER (10) NOT NULL,  --FAMILY SIZE
incmili VARCHAR2 (1) NOT NULL,  --MILITARY STATUS (Y/N)
incbran VARCHAR2 (15) NOT NULL, --BRANCH
inclivew VARCHAR2 (15) NOT NULL,--MEMBER LIVES WITH

--MEDICAL INFO TABLE
CREATE TABLE medin (
medinID NUMBER (10),
medinpname VARCHAR2 (10) NOT NULL, -- PHYSICIAN NAME CHECK THIS
medinphyphn NUMBER (10) NOT NULL, --PHYSICIAN PHONE NUMBER CHECK THIS
medinhos VARCHAR2 (35) NOT NULL, --HOSPICAL/CLINIC
medinhosphn NUMBER (10) NOT NULL, -- HOSPITAL PHONE NUMBER

CONSTRAINT medin_medinID_pk PRIMARY KEY (medinID)) ;
  
  
-- ADDRESS TABLE   
CREATE TABLE addr (
addrID NUMBER (10),
addr
addr  
addr  
  
  

