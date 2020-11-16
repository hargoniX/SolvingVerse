FROM debian:buster

RUN apt-get update
RUN apt-get install -y build-essential clang bison flex libreadline-dev \
                     gawk tcl-dev libffi-dev git mercurial graphviz   \
                     xdot pkg-config python python3 libftdi-dev gperf \
                     libboost-program-options-dev autoconf libgmp-dev \
                     cmake

WORKDIR /install_solvers
COPY install_solvers.sh /install_solvers
RUN chmod +x install_solvers.sh
RUN ./install_solvers.sh

COPY solver.sh /install_solvers
WORKDIR /solver

ENTRYPOINT ["/bin/sh", "/install_solvers/solver.sh"]
