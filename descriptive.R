if("htmlTable" %in% rownames(installed.packages()) == FALSE) {install.packages("htmlTable")}

library(foreign)
library(htmlTable)

# Import SPSS *.sav file
hsb1 = read.spss(
  'hsb1.sav',
  to.data.frame =TRUE
)

# Filter
hsb1.sub = subset(
  hsb1,
  schoolid == 1288
)

# Select variables
variables  = hsb1.sub[c(
  "mathach",
  "ses"
)]

# Select statistics
statistics = function(x) c(
  mean = mean(x),
  sd = sd(x),
  N = length(x)
)

# Descriptive output
output = t(sapply(
  variables,
  statistics,
  USE.NAMES = TRUE
))

# Round decimals
output = round(output, digits = 4)

# Use HTML table to display the output
htmlTable(
  output,
  caption = "Descriptive Statistics",
  header  =  c("mean", "sd", "N")
)

