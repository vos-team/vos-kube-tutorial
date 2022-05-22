FROM --platform=linux/amd64 r-base

RUN apt update && apt install libpq-dev -y
COPY ./ /work/
WORKDIR /work
RUN r install_packages.R

CMD r worker.R
