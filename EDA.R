library(dplyr)
library(haven)
library(rdhs)

# set working directory
setwd(".. - University of California, Davis/School/4th Year/1 Fall 2023/STA 160/STA-160-Final/")

india = read.table("India Flat ASCII data (.dat)/IAAR72FL.DAT", header=TRUE, sep= " ", fill = TRUE)


library(rdhs)

indicators <- dhs_indicators()
p1 <- indicators[order(indicators$IndicatorId), ][1:7, c("IndicatorId", "Definition")]
tags <- dhs_tags() # search by tags
# search for 'HIV' within the column tagName using the grepl function
t1 <- tags[grepl("Malaria", tags$TagName), ]

config <- set_rdhs_config(
  email = "vinhuang@ucdavis.edu",
  project = "STA160Final",
  config_path = "~/.rdhs.json",
  global = TRUE,
  verbose_download = TRUE
)






temp <- tempfile()
download.file("India Flat ASCII data (.dat).zip",temp)
data <- read.table(unz(temp, "IAAR72FL.DAT"))
