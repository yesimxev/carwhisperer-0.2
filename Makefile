# Makefile

CC = gcc
CFLAGS =

all: carwhisperer

carwhisperer:		carwhisperer.c
	$(CC) $(CFLAGS) carwhisperer.c -o carwhisperer -lbluetooth

clean:
	rm -f carwhisperer

install:
	cp carwhisperer	/usr/bin/
	if [ -f /etc/bluetooth/hcid.conf ];then cp /etc/bluetooth/hcid.conf /etc/bluetooth/hcid.conf.old;fi;
	cp hcid.conf /etc/bluetooth/hcid.conf
	cp cw_pin.pl /usr/bin/
	cp cw_scanner /usr/bin/

uninstall:
	rm /usr/bin/carwhisperer
	mv /etc/bluetooth/hcid.conf.old /etc/bluetooth/hcid.conf
	rm /usr/bin/cw_pin.sh 
	rm /usr/bin/cw_scanner 
