FROM lineage_os/d802/kernel:latest

USER root
RUN apt-get update && apt-get install -y git unzip build-essential

RUN git clone https://github.com/google/syzkaller.git /syzkaller

ADD https://redirector.gvt1.com/edgedl/go/go1.9.2.linux-amd64.tar.gz /

WORKDIR /
ADD https://dl.google.com/android/repository/android-ndk-r15c-linux-x86_64.zip /
RUN unzip /android-ndk-r15c-linux-x86_64.zip && rm -f /android-ndk-r15c-linux-x86_64.zip


ENV GOROOT /go
ENV PATH /go/bin/:$PATH
ENV GOPATH /syzkaller
RUN go get -u -d github.com/google/syzkaller/...

WORKDIR /syzkaller/src/github.com/google/syzkaller

RUN apt-get install -y vim

COPY adb.cfg /syzkaller/src/github.com/google/syzkaller/adb.cfg
COPY arm32.patch /syzkaller/src/github.com/google/syzkaller/arm32.patch
RUN patch -p1 arm32.patch


ENV PATH /build/android/lineage/out/host/linux-x86/bin/:$PATH
RUN sed -i 's/__NR_mmap/9/g' executor/executor_linux.cc
# arm32 is not supported by syzkaller
RUN make TARGETARCH=arm TARGETOS=android V=1 TARGETVMARCH=arm NDK=/android-ndk-r15c all
