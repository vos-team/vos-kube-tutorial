FROM --platform=linux/amd64 r-base

RUN apt update && apt install libpq-dev -y
COPY ./install_packages.R /work/
WORKDIR /work
RUN Rscript install_packages.R

COPY ./*.R /work/
CMD Rscript worker.R
