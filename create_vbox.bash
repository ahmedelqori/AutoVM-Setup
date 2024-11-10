#!/bin/bash

source ./.env

DISK_PATH=$PATH
VM_NAME=$NAME
VM_MEMORY=$RAM  
VM_DISK_SIZE=$SIZE  
ISO_PATH=$ISO
VM_CPUS=$CPU 
VM_VRAM=$VRAM

ENABLE_3D="on"
VM_AUDIO="alsa"
VM_BOOT_ORDER="dvd, disk"

VDI_PATH="$DISK_PATH/vm/$VM_NAME.vdi"

/usr/bin/VBoxManage createvm --name "$VM_NAME" --ostype "Linux_64" --register

/usr/bin/VBoxManage modifyvm "$VM_NAME" --memory "$VM_MEMORY" --cpus "$VM_CPUS"

/usr/bin/VBoxManage modifyvm "$VM_NAME" --accelerate3d "$ENABLE_3D" --vram "$VM_VRAM"

/usr/bin/VBoxManage createhd --filename "$VDI_PATH" --size "$VM_DISK_SIZE"

/usr/bin/VBoxManage storagectl "$VM_NAME" --name "SATA Controller" --add sata --controller IntelAhci
/usr/bin/VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$VDI_PATH"

/usr/bin/VBoxManage storagectl "$VM_NAME" --name "IDE Controller" --add ide
/usr/bin/VBoxManage storageattach "$VM_NAME" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium "$ISO_PATH"

/usr/bin/VBoxManage modifyvm "$VM_NAME" --audio-driver "$VM_AUDIO" --clipboard bidirectional

/usr/bin/VBoxManage modifyvm "$VM_NAME" --boot1 dvd --boot2 disk --boot3 none --boot4 none

/usr/bin/VBoxManage sharedfolder add "$VM_NAME" --name "preseed" --hostpath "$DISK_PATH" --automount

/usr/bin/VBoxManage startvm "$VM_NAME"
