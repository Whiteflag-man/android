# android
Create a vendorsetup.sh in device/moto/wingray with this content:

add_lunch_combo aosp_wingray-user
<br>
add_lunch_combo aosp_wingray-userdebug
<br>
add_lunch_combo aosp_wingray-eng

manual Download Manuellama/aosp_android_build 

rename aosp_android_build  → Build

sudo -s
<br>lunch 8 or 9<br>make -j8
