# https://wiki.lineageos.org/devices/d802/build#extract-proprietary-blobs

FROM ubuntu

RUN apt-get update && apt-get install -y bc bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev openjdk-8-jdk

WORKDIR /build

RUN useradd -m -u 1000 tuxx
RUN chown tuxx /build
USER tuxx

RUN mkdir -p bin android/lineage
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > bin/repo && \
    chmod a+x bin/repo

RUN cd /build/android/lineage && \
    /build/bin/repo init -u https://github.com/LineageOS/android.git -b cm-14.1 && \
    /build/bin/repo sync

USER root
RUN ln -s /build/bin/repo /usr/bin/repo
USER tuxx

ENV USE_CCACHE=1
ENV ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

WORKDIR /build/android/lineage
RUN bash -c 'source ./build/envsetup.sh && \
    prebuilts/misc/linux-x86/ccache/ccache -M 50G && \
    breakfast d802'

RUN sed -i 's#</manifest>#<project name="TheMuppets/proprietary_vendor_lge" path="vendor/lge" /></manifest>#g' /build/android/lineage/.repo/local_manifests/roomservice.xml && repo sync

ENV USER tuxx
RUN bash -c 'source ./build/envsetup.sh && croot && brunch d802'
