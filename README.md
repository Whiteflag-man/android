# android
Create a vendorsetup.sh in device/moto/wingray with this content:

add_lunch_combo aosp_wingray-user

add_lunch_combo aosp_wingray-userdebug

add_lunch_combo aosp_wingray-eng

manual Download Manuellama/aosp_android_build 

rename aosp_android_build  → Build

sudo -s
. /build.sh wingray clean
