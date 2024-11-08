#!/bin/bash

DISK_PATH="/goinfre/ael-qori"
VM_NAME="Meedivo"
VM_MEMORY=10240  
VM_DISK_SIZE=40000  
ISO_PATH="$DISK_PATH/iso/ubuntu.iso"
VM_CPUS=10 

ENABLE_3D="on"
VM_VRAM=128
VM_AUDIO="pulse"
VM_BOOT_ORDER="dvd, disk"

VDI_PATH="$DISK_PATH/vm/$VM_NAME.vdi"

VBoxManage createvm --name $VM_NAME --ostype "Linux_64" --register

VBoxManage modifyvm $VM_NAME --memory $VM_MEMORY --cpus $VM_CPUS

VBoxManage modifyvm $VM_NAME --accelerate3d $ENABLE_3D --vram $VM_VRAM

VBoxManage createhd --filename $VDI_PATH --size $VM_DISK_SIZE
VBoxManage storagectl $VM_NAME --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach $VM_NAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium $VDI_PATH

VBoxManage storagectl $VM_NAME --name "IDE Controller" --add ide
VBoxManage storageattach $VM_NAME --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium $ISO_PATH

VBoxManage modifyvm $VM_NAME --audio $VM_AUDIO --clipboard bidirectional

VBoxManage modifyvm $VM_NAME --boot1 dvd --boot2 disk --boot3 none --boot4 none

VBoxManage startvm $VM_NAME
