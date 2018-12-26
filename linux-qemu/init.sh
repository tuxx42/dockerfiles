#!/bin/sh

mount -t proc none /proc
mount -t sysfs none /sys
mount -t debugfs debugfs /sys/kernel/debug

exec /bin/sh
