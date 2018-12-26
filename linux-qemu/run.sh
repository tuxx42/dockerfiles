qemu-system-x86_64 \
   -nographic \
   -enable-kvm \
   -m 1000 \
   -kernel /boot/bzImage \
   -fsdev local,id=root,path=/,readonly,security_model=none \
   -device virtio-9p-pci,fsdev=root,mount_tag=/dev/root \
   -append "root=/dev/root ro rootfstype=9p console=ttyS0 rootflags=trans=virtio init=/init.sh"
