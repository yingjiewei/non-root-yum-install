#!/bin/bash
# Source https://stackoverflow.com/questions/36651091/how-to-install-packages-in-linux-centos-without-root-user-with-automatic-depen
pkgname=$1
if [ -z $pkgname ]; then
	echo "Usage: ./non-root-yum-install.sh pkgname-here"
	exit 1
fi


rand=$(openssl rand -base64 6)

# Download RPM pkg
mkdir -p /tmp/rpmpkgs_$rand
yumdownloader --destdir /tmp/rpmpkgs_$rand --resolve $pkgname
# Extract
mkdir -p ~/bin
cd ~/bin
for rpmfile in `ls /tmp/rpmpkgs_${rand}`; do
	rpm2cpio /tmp/rpmpkgs_${rand}/${rpmfile} | cpio -idv
done

#  _ __ ___   ___   ___
# | '_ ` _ \ / _ \ / _ \
# | | | | | | (_) | (_) |
# |_| |_| |_|\___/ \___/
# This script contains super cow power.

# Use commands below to activate local binaries
# export PATH="$HOME/bin/usr/sbin:$HOME/bin/usr/bin:$HOME/bin/bin:$PATH"
# L='/lib:/lib64:/usr/lib:/usr/lib64'
# export LD_LIBRARY_PATH="$L:$HOME/bin/usr/lib:$HOME/bin/usr/lib64"