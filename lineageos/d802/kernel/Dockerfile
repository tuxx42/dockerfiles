FROM lineage_os/d802/android:latest

WORKDIR /build/android/lineage/out/target/product/d802/obj/KERNEL_OBJ
ENV CROSS_COMPILE /build/android/lineage/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
# RUN make ARCH=arm lineageos_d802_defconfig
RUN make ARCH=arm -j5
