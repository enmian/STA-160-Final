DATA LIST FILE='C:\COUNTRIES\ZW70\ZWAR71FL.DAT' RECORDS=1
  /
  HIVCLUST    1-8   
  HIVNUMB     9-12  
  HIVLINE    13-15  
  HIV01      16-21   (A)
  HIV02      22-27  
  HIV03      28-28  
  HIV05      29-36  
  HIVAGE     37-38  
  HIVSEX     39-39  
 .
VARIABLE LABELS
   HIVCLUST "Cluster"
  /HIVNUMB  "Household"
  /HIVLINE  "Line"
  /HIV01    "Bar code"
  /HIV02    "Lab number"
  /HIV03    "Blood test result"
  /HIV05    "Sample weight"
  /HIVAGE   "Age in years"
  /HIVSEX   "Gender"
 .
VALUE LABELS
   HIV03   
      0 "HIV negative"
      1 "HIV  positive"
      2 "HIV2 positive"
      3 "HIV1 & HIV2 positive"
      4 "ERROR : V-, W+, M+"
      5 "ERROR : V-, W+, M-"
      6 "ERROR : V-, W-, M+"
      7 "Indeterminant"
  /HIVSEX  
      1 "Male"
      2 "Female"
 .
 EXECUTE.
SAVE OUTFILE='C:\COUNTRIES\ZW70\ZWAR71FL.sav'.
