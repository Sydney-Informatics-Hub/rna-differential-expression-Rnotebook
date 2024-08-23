FROM rocker/rstudio:4.1.0

LABEL org.opencontainers.image.authors="Sydney Informatics Hub"

# Install system-level packages or dependencies required by other softwares or packages 
# Add additional package(s) one per line by using a the backlash (`\`) separater, as seen below 
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \
  libcairo2-dev \
  libsqlite-dev \
  libmagick++-dev \
  libmariadbd-dev \
  libmariadbclient-dev \
  libpq-dev \
  libssh2-1-dev \
  unixodbc-dev \
  libsasl2-dev \
  libglpk-dev \
  default-jre \
  default-jdk
  
# Install R packages related to data - manipulation, visualisation
# Add additional package(s) one per line by using a the backlash (`\`) separater, as seen below   
RUN install2.r --error --skipinstalled --ncpus -4 \
    --deps TRUE \
    caTools \
    devtools \
    dplyr \
    factoextra \
    formatR \
    ggplot2 \
    gplots \
    RColorBrewer \
    remotes \
    rstudioapi \
    selectr \
    tibble 

# Install Bioconductor related packages
RUN R -e 'install.packages("BiocManager")'

RUN R -e 'BiocManager::install(version = "3.14"); library(BiocManager); \
          BiocManager::install(c("AnnotationDbi", "MatrixGenerics", "biobroom", "biomaRt", "DESeq2", "org.Mm.eg.db", "org.Hs.eg.db", "KEGGgraph", "KEGGREST", "EnhancedVolcano"))'

RUN R -e 'install.packages("pathfindR")'

RUN R -e 'devtools::install_github("YuLab-SMU/yulab.utils")'

RUN R -e 'BiocManager::install(version = "3.14"); library(BiocManager); \
          BiocManager::install("clusterProfiler")'

RUN chown -R root:root /var/lib/rstudio-server && chmod -R g=u /var/lib/rstudio-server

# Set the default working directory to the mounted Gitpod workspace
WORKDIR /workspace/rna-differential-expression-Rnotebook

# Expose the RStudio Server port
EXPOSE 8787
