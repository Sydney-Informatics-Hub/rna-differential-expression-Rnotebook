# setup.R

# Load the rstudioapi package
if (!requireNamespace("rstudioapi", quietly = TRUE)) {
  install.packages("rstudioapi", repos='http://cran.rstudio.com/')
}
library(rstudioapi)

# Set the working directory to the repository root
setwd("/workspace/rna-differential-expression-Rnotebook")

# Open the entire repository in the File Viewer
openProject("/workspace/rna-differential-expression-Rnotebook", newSession = FALSE)

# Optionally, open a specific RMarkdown file or script
navigateToFile("rnaseq_DE_analysis.Rmd")
