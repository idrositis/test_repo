#!/bin/bash
# Lame script to remove older kernels

current_kernel_version=$(uname -r)

rest_installed_linux_kernels=$(dpkg --get-selections|egrep "linux-image-[0-9]"|grep -v ${current_kernel_version}|sort|awk '{print $1}')

for xKernel in ${rest_installed_linux_kernels}; do
  echo "Removing ${xKernel}..."
  sudo apt-get --yes purge ${xKernel}
done

sudo update-grub2

exit 0
