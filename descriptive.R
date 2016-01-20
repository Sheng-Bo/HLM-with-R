if("foreign" %in% rownames(installed.packages()) == FALSE) {install.packages("foreign")}
if("JGR" %in% rownames(installed.packages()) == FALSE) {install.packages("JGR")}
if("Deducer" %in% rownames(installed.packages()) == FALSE) {install.packages("Deducer")}
if("htmlTable" %in% rownames(installed.packages()) == FALSE) {install.packages("htmlTable")}

library(foreign)
library(JGR)
library(Deducer)
library(htmlTable)

hsb1 = read.spss (
  'hsb1.sav',
  to.data.frame =TRUE
)

hsb1.sub = subset (
  hsb1,
  schoolid == 1288
)

output = descriptive.table (
  vars = d(ses,mathach),
  data = hsb1.sub,
  func.names = c("Mean","St. Deviation","Valid N")
)

output = data.frame(output)

htmlTable(
  output,
  header  =  c("mean", "sd", "N"),
  caption = "Descriptive Statistics"
)

