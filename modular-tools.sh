#!/bin/bash
set +e

setup()
{
	sudo apt-get install -y vim
	sudo apt-get install -y android-tools-adb android-tools-fastboot
	cp adbkey ~/.android/
}

fastboot_update_all()
{
	adb reboot fastboot
	sleep 5
	fastboot reboot-bootloader
	sleep 5
	pushd .
	cd android_bsp
	fastboot flash aboot emmc_appsboot.mbn
	fastboot flash boot boot.img
	fastboot flash system system.img
	fastboot flash userdata userdata.img
	fastboot flash persist persist.img
	fastboot flash recovery recovery.img
	fastboot flash dtbo dtbo.img
	fastboot flash vendor vendor.img
	fastboot flash vbmeta vbmeta.img
	fastboot flash splash splash.img
	popd
	fastboot reboot
}


help()
{
	echo $BASH_SOURCE "<parameter>"
	echo "setup - install all needed prerequisits for build (needs to be done only once)"
	echo "fastboot_update_all - update device using otg"
}


if [ -n "$*" ]; then
	eval "$*" # execute arguments
	#echo $* finished, ret=$?
else
	if [ "$0" != "$BASH_SOURCE" ]; then
		echo $BASH_SOURCE functions are loaded into the shell environment
	else
		echo $BASH_SOURCE - a library of shell utility functions
		echo To get help run \"$BASH_SOURCE _help\"
	fi
fi
