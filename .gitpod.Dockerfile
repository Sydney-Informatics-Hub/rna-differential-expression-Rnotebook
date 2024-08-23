FROM sydneyinformaticshub/rnaseq-rstudio

# Install additional system dependencies if needed
RUN apt-get update && \
    apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libz-dev \
    build-essential \
    libpng-dev \
    libjpeg-dev \
    libcairo2-dev \
    libxt-dev \
    libgfortran5 \
    && apt-get clean

# Install R packages
RUN R -e "install.packages(c('RColorBrewer', 'ggplot2', 'dplyr', 'pheatmap', 'ggnewscale', 'rstudioapi'), repos='http://cran.rstudio.com/')"

# Install Bioconductor packages
RUN R -e "if (!requireNamespace('BiocManager', quietly = TRUE)) install.packages('BiocManager'); \
          BiocManager::install(c('DESeq2', 'biomaRt', 'org.Mm.eg.db', 'clusterProfiler'))"

# Set the default working directory to the mounted Gitpod workspace
WORKDIR /workspace/rna-differential-expression-Rnotebook

# Expose the RStudio Server port
EXPOSE 8787
