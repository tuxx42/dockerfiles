FROM debian:stretch

ADD https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.15.tar.xz /

RUN apt-get update && apt-get install -y \
   build-essential \
   libncurses-dev \
   qemu-system \
   libelf-dev \
   bc \
   libssl-dev

COPY config /out/.config
RUN tar xvf /linux-4.15.tar.xz && \
    cd /linux-4.15 && make O=/out -j6 && \
    cp /out/arch/x86/boot/bzImage /boot/bzImage

# config is "make defconfig kvmconfig && sed -i 's/.*CONFIG_MMIOTRACER.*/CONFIG_MMIOTRACER=y/g'"
WORKDIR /linux-4.15

COPY init.sh /init.sh
COPY run.sh /run.sh
CMD '/run.sh'


