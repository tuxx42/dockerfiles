FROM lineage_os/d802/android:latest
ENV DEBIAN_FRONTEND noninteractive

USER root
RUN apt-get update
RUN apt-get install -y libxml2-dev python2.7 git cmake g++ pkg-config python-ipdb python-lxml
RUN git clone https://github.com/ucsb-seclab/difuze.git /difuze

# build llvm
WORKDIR /difuze/helper_scripts
RUN chown -R tuxx /difuze
USER tuxx
RUN python2.7 setup_difuze.py -o difuze_deps

WORKDIR /difuze/InterfaceHandlers
ENV PATH /difuze/helper_scripts/difuze_deps/llvm/build/bin:/difuze/helper_scripts/difuze_deps/sparse:$PATH
RUN ./build.sh

# build kernel
WORKDIR /build/android/lineage/out/target/product/d802/obj/KERNEL_OBJ
ENV CROSS_COMPILE /build/android/lineage/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-

RUN make V=1 2>&1 | tee /build/android/lineage/out/target/product/d802/obj/KERNEL_OBJ/makeout.txt

USER root
WORKDIR /difuze/helper_scripts
RUN sed -i 's/-fno-ipa-sra//g' /build/android/lineage/out/target/product/d802/obj/KERNEL_OBJ/makeout.txt
RUN python run_all.py \
 -l llvm_bc_out \
 -a 2 \
 -m /build/android/lineage/out/target/product/d802/obj/KERNEL_OBJ/makeout.txt \
 -o /build/android/lineage/out/target/product/d802/obj/KERNEL_OBJ/ \
 -g /build/android/lineage/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-gcc \
 -n 1 \
 -k /build/android/lineage/out/target/product/d802/obj/KERNEL_OBJ/source \
 -f /ioctl_finder_out
