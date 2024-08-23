# Project-specific .Rprofile
if (interactive()) {

  # Preload rstudioapi
  suppressMessages({
    if (!requireNamespace("rstudioapi", quietly = TRUE)) {
      install.packages("rstudioapi", repos='http://cran.rstudio.com/')
    }
    library(rstudioapi)
  })

  # Set working directory
  setwd("/workspace/rna-differential-expression-Rnotebook")

  # Open an R Markdown file automatically
  rstudioapi::navigateToFile("rnaseq_DE_analysis.Rmd")
}
