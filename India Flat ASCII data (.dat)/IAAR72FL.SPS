DATA LIST FILE='C:\COUNTRIES\IA72\IAAR72FL.DAT' RECORDS=1
  /
  HIVCLUST    1-6   
  HIVNUMB     7-12  
  HIVLINE    13-15  
  HIV01      16-21   (A)
  HIV02      22-27  
  HIV03      28-28  
  HIV05      29-36  
 .
VARIABLE LABELS
   HIVCLUST "Cluster"
  /HIVNUMB  "Household"
  /HIVLINE  "Line"
  /HIV01    "Bar code"
  /HIV02    "Lab number"
  /HIV03    "Blood test result"
  /HIV05    "Sample weight"
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
      7 "Indeterminate"
      8 "Not enough samples to complete protocol"
      9 "Inconclusive"
 .
 EXECUTE.
SAVE OUTFILE='C:\COUNTRIES\IA72\IAAR72FL.sav'.
