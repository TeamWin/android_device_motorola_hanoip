#!/system/bin/sh

# mount points
path=/sbin
mount /vendor
cp -r /vendor/lib/modules $path
cp -r /vendor/firmware $path
umount /vendor

# Apply pathces to temporary vendor
cd /vendor
mkdir lib
cp -r $path/modules /vendor/lib
cp -r $path/firmware /vendor

# Clean up temporary data
rm -r $path/modules
rm -r $path/firmware

# Run TouchScreen Patch
/system/bin/sh /system/bin/hanoip_touch.sh 2> $path/TouchScreenlog.txt
/system/bin/sh /system/bin/hanoip_touch.sh 2>> $path/TouchScreenlog.txt

exit 0