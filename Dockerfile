FROM bioconductor/bioconductor_docker:RELEASE_3_22

# Update apt-get
RUN apt-get update -y \
        && apt-get upgrade -y \
        && apt-get install -y nano git x11-apps \
        ## Remove packages in '/var/cache/' and 'var/lib'
        ## to remove side-effects of apt-get update
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

# Install CRAN packages
RUN Rscript -e 'install.packages(c("DT", "MASS", "WGCNA", "beeswarm", "dplyr", "eulerr", "ggplot2", "gplots", "kableExtra", "reshape2", "xlsx"))'

# Install bioconductor packages
RUN Rscript -e 'BiocManager::install(c("mitch","DESeq2"))'

# get a clone of the codes using HTTPS
RUN git clone https://github.com/markziemann/paddi-genomics.git

# 
COPY 3col.tsv.gz /paddi-genomics

# Set the container working directory
ENV DIRPATH=/paddi-genomics
WORKDIR $DIRPATH


