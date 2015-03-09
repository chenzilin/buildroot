TARGETDIR=$1

# modify cmdline prompt in inittab
echo "export PS1='\u@\h:\w\\$ '" >> $TARGETDIR/etc/profile

# add eth0 static entry into /etc/network/interfaces
cp board/raspberrypi/interfaces $TARGETDIR/etc/network/

# change default serial port
sed -i "s/-L  tty1 115200/-L  ttyAMA0 115200/g" $TARGETDIR/etc/inittab

# change cmdline.txt to kernel
cp board/raspberrypi/cmdline.txt $TARGETDIR/../images/rpi-firmware/
