-- Tables for 344 Project

/* DROP STATEMENTS */

/* CREATE STATEMENTS */

--PERSON TABLE
CREATE TABLE per (
perID VARCHAR2(35),
perfname VARCHAR2(35),
perlname VARCHAR2(35),
permname VARCHAR2 (35),
perdob DATE,
pereth VARCHAR2 (35),
pergen VARCHAR2 (1),
perema VARCHAR2 (35),

CONSTRAINT per_perID_pk PRIMARY KEY(perID);

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
  
  
  

