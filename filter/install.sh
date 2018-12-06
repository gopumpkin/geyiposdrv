#!/bin/sh
cp ./$(uname -m)/rastertopos /usr/lib/cups/filter/
chmod a+x /usr/lib/cups/filter/rastertopos
sync

