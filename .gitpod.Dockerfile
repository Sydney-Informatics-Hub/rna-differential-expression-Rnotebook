FROM rocker/rstudio:4.1.2

# Install additional system dependencies if needed
RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libxml2-dev \
    libssl-dev \
    && apt-get clean

# Install R packages
RUN R -e "install.packages(c('RColorBrewer', 'ggplot2', 'dplyr', 'pheatmap', 'ggnewscale'), repos='http://cran.rstudio.com/')"

# Install Bioconductor packages
RUN R -e "if (!requireNamespace('BiocManager', quietly = TRUE)) install.packages('BiocManager'); \
          BiocManager::install(c('DESeq2', 'biomaRt', 'org.Mm.eg.db', 'clusterProfiler'))"

# Expose the RStudio Server port
EXPOSE 8787
