FROM rocker/rstudio:4.1.2

# Install additional dependencies if needed
RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libxml2-dev \
    libssl-dev \
    && apt-get clean

# Expose the RStudio Server port
EXPOSE 8787