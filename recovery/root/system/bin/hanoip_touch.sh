#!/system/bin/sh

module_path=/sbin/modules
firmware_path=/sbin/firmware
touch_class_path=/sys/class/touchscreen
insmod $module_path/exfat.ko
insmod $module_path/ilitek_v3_mmi.ko
insmod $module_path/mmi_info.ko
insmod $module_path/moto_f_usbnet.ko
insmod $module_path/qpnp_adaptive_charge.ko
insmod $module_path/sx933x_sar.ko
insmod $module_path/fpc1020_mmi.ko
insmod $module_path/mmi_annotate.ko
insmod $module_path/mmi_sys_temp.ko
insmod $module_path/mpq-adapter.ko
insmod $module_path/sensors_class.ko
insmod $module_path/utags.ko
cd $firmware_path
touch_product_string=$(ls $touch_class_path)
echo "ilitek"
firmware_file="FW_ILITEK_TDDI_TM.bin"
touch_path=/sys$(cat $touch_class_path/$touch_product_string/path | awk '{print $1}')
wait_for_poweron
echo $firmware_file > $touch_path/doreflash
echo 1 > $touch_path/forcereflash
sleep 5
echo 1 > $touch_path/reset

