#!/system/bin/sh

# Run TouchScreen Patch For Stock Users

path=/sbin
mount /vendor
cp -r /vendor/lib/modules $path
cp -r /vendor/firmware $path
umount /vendor
/system/bin/sh /system/bin/hanoip_touch.sh 2> $path/TouchScreenlog.txt
/system/bin/sh /system/bin/hanoip_touch.sh 2>> $path/TouchScreenlog.txt

exit 0
