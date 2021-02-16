FROM ubuntu:18.04

RUN cd /etc/apt && \
    sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' sources.list

RUN apt-get update && \
    apt-get install -y git wget unzip libglib2.0-dev libeina-dev \
    qemu-user qemu-user-static binutils-aarch64-linux-gnu binutils-aarch64-linux-gnu-dbg build-essential  \
    gcc-aarch64-linux-gnu g++-aarch64-linux-gnu qemu-system-arm gdb-multiarch libtool-bin python automake bison vim

RUN mkdir /home/afl/
WORKDIR /home/afl

RUN git clone https://github.com/pwndbg/pwndbg.git
WORKDIR /home/afl/pwndbg
RUN ./setup.sh

WORKDIR /home/afl
RUN git clone https://github.com/google/AFL.git
WORKDIR /home/afl/AFL

RUN AFL_NO_X86=1 make
RUN cd qemu_mode && CPU_TARGET=aarch64 ./build_qemu_support.sh
RUN AFL_NO_X86=1 make install

WORKDIR /home/afl/

ENV QEMU_LD_PREFIX /usr/aarch64-linux-gnu
