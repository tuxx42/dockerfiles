FROM ubuntu:16.04

# Make sure the image is updated, install some prerequisites,
# Download the latest version of Clang (official binary) for Ubuntu
# Extract the archive and add Clang to the PATH

RUN apt-get update && \
    apt-get install -y \
        autoconf \
        automake \
        build-essential \
        curl \
        git \
        libbase58-dev \
        libgmp-dev \
        libprotobuf-c-dev \
        libsodium-dev \
        libsqlite3-dev \
        libtool \
        net-tools \
        python2.7 \
        python3 \
        vim \
        wget \
        xz-utils && \
   ln -sf /usr/bin/python3 /usr/bin/python

RUN mkdir /TMP_CLANG && \
    cd /TMP_CLANG && \
    git clone https://chromium.googlesource.com/chromium/src/tools/clang && \
    cd .. && \
    python2.7 /TMP_CLANG/clang/scripts/update.py

ENV PATH=/third_party/llvm-build/Release+Asserts/bin/:$PATH
ENV LD_LIBRARY_PATH=/third_party/llvm-build/Release+Asserts/lib/:LD_LIBRARY_PATH

# Start from a Bash prompt
CMD [ "/bin/bash" ]
