FROM llvm-mos-builder:v1 
ARG DEBIAN_FRONTEND=noninteractive


RUN cd /tmp && git clone https://github.com/llvm-mos/llvm-mos-sdk
COPY bin/llvm-mos-linux.tar.xz /tmp
RUN tar -xf /tmp/llvm-mos-linux.tar.xz -C /tmp 
ENV PATH=$PATH:/tmp/llvm-mos/bin

RUN cd /tmp/llvm-mos-sdk && \
    mkdir build && cd build &&\
    cmake -G "Ninja" -DCMAKE_INSTALL_PREFIX=/tmp/llvm-mos .. && \
    ninja install
    
RUN rm -Rf /tmp/llvm-mos-sdk  && rm -Rf /tmp/llvm-mos-linux.tar.xz