FROM nfcore/base:1.13.2
LABEL authors="Simon Heumos, Michael L Heuer" \
      description="Docker image containing all software requirements for the nf-core/pangenome pipeline"

# Install the conda environment
COPY environment.yml /
RUN conda env create --quiet -f /environment.yml && conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/nf-core-pangenome-1.0dev/bin:$PATH

# Dump the details of the installed packages to a file for posterity
RUN conda env export --name nf-core-pangenome-1.0dev > nf-core-pangenome-1.0dev.yml
