
## Survival Curves


# Not a totally useful thing in our line of work as it's used more in the biology industry. 
# Kind of cool, and I did it once so it's a shame to get rid of it! 


# These packages need to be installed before load
install.packages("GGally", dependencies = TRUE, repos = "http://cran.rstudio.com") # download GGally package
install.packages("survival", dependencies = TRUE, repos = "http://cran.rstudio.com") # download survival package

# Load your libraries
library(ggplot2)
library(GGally)
library(survival)



# Read your data in
OneDay <- read.csv("DataSets/EssexOneDayCSV.csv")


# This creates a survival model
KM1D <- survfit(
  Surv(Balls, Out) ~ Position,   # Choose the variables you're looking at
  type = "kaplan-meier",         # Estimates survival function from the lifetime data
  conf.type = "log",             # Leave this as is
  data = OneDay                  # This is your data
) 



# Create plot
g <- ggsurv(KM1D)  # ggsurv is in the GGally package (an extension to ggplot2)
g <- g + labs(title = "Survival Curves")
g <- g + labs(subtitle = "put subtitle here")
g <- g + labs(x = "label x axis here")
g <- g + labs(y = "label y axis here")
g <- g + theme_light()
g







