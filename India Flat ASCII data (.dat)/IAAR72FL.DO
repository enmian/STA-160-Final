infix using "C:\COUNTRIES\IA72\IAAR72FL.dct"

label variable hivclust "Cluster"
label variable hivnumb  "Household"
label variable hivline  "Line"
label variable hiv01    "Bar code"
label variable hiv02    "Lab number"
label variable hiv03    "Blood test result"
label variable hiv05    "Sample weight"

#delimit ;
label define HIV03   
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
;

#delimit cr
label values hiv03    HIV03   
