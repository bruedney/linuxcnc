#!/bin/bash
status=1
while [[ $status == 1 ]]
do
ping -c1 -W1 -q 192.168.1.121 &>/dev/null
status=$( echo $? )
done| yad --progress\
	--title="LinuxCNC - Controller" \
	--width=300 --height=100 \
	--no-buttons\
	--auto-close\
	--auto-kill\
	--text="The Controller is not powered up" 

linuxcnc /home/bruce/linuxcnc/configs/Luxcut_DM20VS-MESA/Luxcut_DM20VS-MESA.ini
