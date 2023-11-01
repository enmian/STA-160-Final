libname user 'C:\COUNTRIES\IA72';
Proc format;
  value F00001_
     0 = "HIV negative"
     1 = "HIV  positive"
     2 = "HIV2 positive"
     3 = "HIV1 & HIV2 positive"
     4 = "ERROR : V-, W+, M+"
     5 = "ERROR : V-, W+, M-"
     6 = "ERROR : V-, W-, M+"
     7 = "Indeterminate"
     8 = "Not enough samples to complete protocol"
     9 = "Inconclusive"
     ;
Data user.IAAR72FL;
  attrib HIVCLUST label="Cluster";
  attrib HIVNUMB  label="Household";
  attrib HIVLINE  label="Line";
  attrib HIV01    length=$6 label="Bar code";
  attrib HIV02    label="Lab number";
  attrib HIV03    format=F00001_. label="Blood test result";
  attrib HIV05    label="Sample weight";
infile 'C:\COUNTRIES\IA72\IAAR72FL.DAT' LRECL=36 MISSOVER ;
    input
    @1    HIVCLUST 6.0
    @7    HIVNUMB  6.0
    @13   HIVLINE  3.0
    @16   HIV01    $6.
    @22   HIV02    6.0
    @28   HIV03    1.0
    @29   HIV05    8.0
    ;
Run;
