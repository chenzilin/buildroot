TARGETDIR=$1

# modify cmdline prompt in inittab
echo "export PS1='\u@\h:\w\\$ '" >> $TARGETDIR/etc/profile

# add eth0 static entry into /etc/network/interfaces
cp board/raspberrypi/interfaces $TARGETDIR/etc/network/

# change cmdline.txt to kernel
cp board/raspberrypi/cmdline.txt $TARGETDIR/../images/rpi-firmware/

# add init start demo entry into /etc/init.d/S45demo
cp board/raspberrypi/S45demo $TARGETDIR/etc/init.d/
