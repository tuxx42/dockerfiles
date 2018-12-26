# Dockerfile collection

This is a collection of useful dockerfiles

## linux-qemu

This repository builds a linux-4.15 kernel within a debian:stretch docker container boots it in qemu, using the docker file system as the rootfs

```
>>> sudo docker run -it --privileged linux-qemu:latest
```

## llvm-fuzz

This repository contains build instructions on how to use google-chrome's nightly build llvm toolchain, including libfuzzer

```
>>> sudo docker run -it libfuzzer:latest
```

## lineageos/d802

This repository builds a lineageos android for the d802

```
>>> sudo docker run -it lineageos_android_d802:latest
```

## lineageos/difuze

This repository builds a lineageos difuze for the d802

```
>>> sudo docker run -it lineageos_android_d802:latest
```

## lineageos/syzkaller

This repository builds a lineageos syzkaller for the d802

```
>>> sudo docker run -it lineageos_android_d802:latest
```

## lineageos/kernel

This repository builds a lineageos standalone kernel for the d802

```
>>> sudo docker run -it lineageos_android_d802:latest
```
