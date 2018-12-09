#!/bin/sh
/etc/init.d/cups stop
cd filter
cp ./$(uname -m)/rastertopos /usr/lib/cups/filter/
mkdir -p /usr/share/cups/model/geyipos
cd ../ppd
cp *.ppd /usr/share/cups/model/geyipos/
cd /usr/lib/cups/filter
chmod 755 rastertopos
chown root:root rastertops
cd -
/etc/init.d/cups start
