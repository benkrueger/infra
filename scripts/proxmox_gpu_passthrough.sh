#!/bin/sh
blacklist_host_drivers (){
    echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf;
    echo "blacklist nvidia*" >> /etc/modprobe.d/blacklist.conf;
}
enable_grub_iommu (){
    sed -i '/GRUB_CMDLINE_LINUX_DEFAULT=""/c\GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on"' /etc/default/grub;
    update-grub
}
enable_efi_iommu (){
    echo "intel_iommu=on" >> /etc/kernel/cmdline;
    proxmox-boot-tool refresh;
}
allow_unsafe_interrupts (){
    echo "options vfio_iommu_type1 allow_unsafe_interrupts=1" > /etc/modprobe.d/iommu_unsafe_interrupts.conf
}
enable_vfio_mods (){
echo "
vfio
vfio_iommu_type1
vfio_pci
vfio_virqfd
" >> /etc/modules;
}

main (){
    blacklist_host_drivers;
    enable_grub_iommu;
    enable_efi_iommu;
    allow_unsafe_interrupts;
    enable_vfio_mods;
}
