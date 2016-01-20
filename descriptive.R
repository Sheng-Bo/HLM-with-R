library(foreign)
library(htmlTable)

hsb1       = read.spss('hsb1.sav',to.data.frame =TRUE)
myschool   = subset(hsb1, schoolid                                                                                                             =='1288')

variables  = myschool[c("mathach", "ses")]
statistics = function(x) c(mean                                                                                                                = mean(x), sd = sd(x), N = length(x))
output     = t(sapply(variables, statistics))

htmlTable(
	output,
	header  =  c("mean", "sd", "N"),
	caption = "Descriptive Statistics"
)
