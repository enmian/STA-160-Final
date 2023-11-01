libname user 'C:\COUNTRIES\ZW70';
Proc format;
  value F00001_
     0 = "HIV negative"
     1 = "HIV  positive"
     2 = "HIV2 positive"
     3 = "HIV1 & HIV2 positive"
     4 = "ERROR : V-, W+, M+"
     5 = "ERROR : V-, W+, M-"
     6 = "ERROR : V-, W-, M+"
     7 = "Indeterminant"
     ;
  value F00002_
     1 = "Male"
     2 = "Female"
     ;
Data user.ZWAR71FL;
  attrib HIVCLUST label="Cluster";
  attrib HIVNUMB  label="Household";
  attrib HIVLINE  label="Line";
  attrib HIV01    length=$6 label="Bar code";
  attrib HIV02    label="Lab number";
  attrib HIV03    format=F00001_. label="Blood test result";
  attrib HIV05    label="Sample weight";
  attrib HIVAGE   label="Age in years";
  attrib HIVSEX   format=F00002_. label="Gender";
infile 'C:\COUNTRIES\ZW70\ZWAR71FL.DAT' LRECL=39 MISSOVER ;
    input
    @1    HIVCLUST 8.0
    @9    HIVNUMB  4.0
    @13   HIVLINE  3.0
    @16   HIV01    $6.
    @22   HIV02    6.0
    @28   HIV03    1.0
    @29   HIV05    8.0
    @37   HIVAGE   2.0
    @39   HIVSEX   1.0
    ;
Run;
