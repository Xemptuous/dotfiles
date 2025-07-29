#!/bin/fish
if test -n "$(grep 'wd_arch.conf' /boot/loader/loader.conf)"
    sudo sed -i 's/wd_arch.conf/wd_arch_vm.conf/g' /boot/loader/loader.conf
    sudo sed -i 's/#//' /etc/modprobe.d/vfio.conf
    sudo mkinitcpio -P
    echo VM ON
else
    sudo sed -i 's/wd_arch_vm.conf/wd_arch.conf/g' /boot/loader/loader.conf
    sudo sed -i 's/^/#/' /etc/modprobe.d/vfio.conf
    echo VM OFF
    sudo mkinitcpio -P
end
