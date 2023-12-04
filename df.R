library("rdhs")
library("tidyr")
library("DT")
library("ggpubr")
library("tidyverse")
library("tibble")
library("ggplot2")

indicators = dhs_indicators()
tags = dhs_tags()
hiv_tag = tags[grepl("HIV", tags$TagName), ]
countryIds = c("CM", "ZM")

# 30, 28, 29, 76, 31
data_31 = dhs_data(tagIds = 31, countryIds = c("CM", "ZM"), breakdown = "subnational", surveyYearStart = 2011)
data_76 = dhs_data(tagIds = 76, countryIds = c("CM", "ZM"), breakdown = "subnational", surveyYearStart = 2011)
data_29 = dhs_data(tagIds = 29, countryIds = c("CM","ZM"), breakdown = "subnational", surveyYearStart = 2011)
data_28 = dhs_data(tagIds = 28, countryIds = c("CM","ZM"), breakdown = "subnational", surveyYearStart = 2011)
data_30 = dhs_data(tagIds = 30, countryIds = c("CM","ZM"), breakdown = "subnational", surveyYearStart = 2011)

cam_women = subset(data_76, data_76$Indicator == "Women who know where to get an HIV test")
colnames(cam_women)[5] = "Women who know where to get an HIV test"
#cam_prev = data_31[c(5, 8)]
cam_prev = subset(data_31, data_31$Indicator == "HIV prevalence among women")
cam_prev = cam_prev[c(5, 8, 15)]
colnames(cam_prev)[1] = "HIV prevalence among women"

cam_women = cam_women[c(5, 8)]
cam_combo1 = merge(cam_women, cam_prev, by = "RegionId", all = TRUE)
# ok so far

HIVMenKnow = subset(data_76, data_76$Indicator == "Men who know where to get an HIV test")
colnames(HIVMenKnow)[5] = "Men who know where to get an HIV test"
HIVMenKnow = HIVMenKnow[c(5, 8)]

HIVMenPrev = subset(data_31, data_31$Indicator == "HIV prevalence among men")
HIVMenPrev = HIVMenPrev[c(5, 8)]
colnames(HIVMenPrev)[1] = "HIV prevalence among men"

cam_combo2 = merge(HIVMenKnow, HIVMenPrev, by = "RegionId", all = TRUE)

df = merge(cam_combo2, cam_combo1, by = "RegionId", all = TRUE)

#ok

# HIV prevalence among general population
HIVGen = subset(data_31, data_31$Indicator == "HIV prevalence among general population")
colnames(HIVGen)[5] = "HIV prevalence among general population"
HIVGen = HIVGen[c(5, 8)]
df = merge(df, HIVGen, by = "RegionId")

unique(data_31$Indicator)

# HIV prev among young women and men aged 15-24
HIVYoungW = subset(data_31, data_31$Indicator == "HIV prevalence among young women aged 15-24")
colnames(HIVYoungW)[5] = "HIV prevalence among young women aged 15-24"
HIVYoungW = HIVYoungW[c(5, 8)]

HIVYoungM = subset(data_31, data_31$Indicator == "HIV prevalence among young men aged 15-24")
colnames(HIVYoungM)[5] = "HIV prevalence among young men aged 15-24"
HIVYoungM = HIVYoungM[c(5, 8)]

df = merge(df, HIVYoungW, by = "RegionId", all = TRUE)
df = merge(df, HIVYoungM, by = "RegionId", all = TRUE)

# good so far
# merging attititudes
unique(data_28$Indicator)
indicators = c("Accepting attitudes towards those living with HIV - Composite of 4 components [Women]", "Accepting attitudes towards those living with HIV - Composite of 4 components [Men]", "Adult support of education on condom use for prevention of HIV/AIDS among young women", "Adult support of education on condom use for prevention of HIV/AIDS among young men")
for (indicator in indicators) {
  attitudeDf = subset(data_28, data_28$Indicator == indicator)
  colnames(attitudeDf)[5] = indicator
  attitudeDf = attitudeDf[c(5, 8)]
  df = merge(df, attitudeDf, by = "RegionId", all = TRUE)
} 

tempdf = df

# sexual activity
unique(data_29$Indicator)
indicators = c("Higher risk sex in the last year [Women]", "Condom use at last higher risk sex (with a non-marital, non-cohabiting partner) [Women]", "Higher risk sex in the last year [Men]", "Condom use at last higher risk sex (with a non-marital, non-cohabiting partner) [Men]", "Higher-risk Sex (with multiple partners among all respondents) [Women]", "Higher-risk Sex (with multiple partners among all respondents) [Men]")
for (indicator in indicators) {
  sexActivityDf = subset(data_29, data_29$Indicator == indicator)
  colnames(sexActivityDf)[5] = indicator
  sexActivityDf = sexActivityDf[c(5, 8)]
  df = merge(df, sexActivityDf, by = "RegionId", all = TRUE)
} 

# knowledge
unique(data_30$Indicator)
indicators = c("Women who have heard of HIV or AIDS", "Men who have heard of HIV or AIDS", "Knowledge of HIV prevention methods - Composite of 2 components (prompted) [Women]", "Knowledge of HIV prevention methods - Composite of 2 components (prompted) [Men]")
for (indicator in indicators) {
  knowledgeDf = subset(data_30, data_30$Indicator == indicator)
  colnames(knowledgeDf)[5] = indicator
  knowledgeDf = knowledgeDf[c(5, 8)]
  df = merge(df, knowledgeDf, by = "RegionId", all = TRUE)
}

write.csv(df, "HIV.csv", row.names=FALSE, quote=FALSE) 
