# test_rpi

usage: 

sshto RPI (user: pi, password: raspberry)

cd ~/

git clone git@github.com:deadpoolcode1/test_rpi.git

cd test_rpi

. modular-tools.sh setup

mkdir android_bsp

now copy the image files to this directory

then to flash commodore device, connect RPI to device via UAB and send command:

. modular-tools.sh fastboot_update_All
