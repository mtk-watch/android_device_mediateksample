#For GMO to reduce runtime memroy usage
ifeq (yes,$(strip $(MTK_GMO_RAM_OPTIMIZE)))

ifneq (yes,$(strip $(MTK_BASIC_PACKAGE)))
ifneq (yes,$(strip $(MTK_BSP_PACKAGE)))
#only support at tk (not basic and bsp package)

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.hwui.path_cache_size=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.hwui.text_small_cache_width=512
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.hwui.text_small_cache_height=256
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.hwui.disable_asset_atlas=true

endif
endif


# Disable fast starting window in GMO project

#Images for LCD test in factory mode
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/common/factory/res/images/lcd_test_00_gmo.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_00.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/common/factory/res/images/lcd_test_01_gmo.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_01.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/common/factory/res/images/lcd_test_02_gmo.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_02.png:mtk

endif

# PRODUCT_COPY_FILES += $(LOCAL_PATH)/egl.cfg:system/lib/egl/egl.cfg
# PRODUCT_COPY_FILES += $(LOCAL_PATH)/ueventd.mt6755.rc:root/ueventd.mt6755.rc

PRODUCT_COPY_FILES += $(LOCAL_PATH)/factory_init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/factory_init.project.rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.project.rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/meta_init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/meta_init.project.rc

ifeq ($(strip $(MTK_C2K_SUPPORT)),yes)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/init.c2k.rc:root/init.c2k.rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/meta_init.c2k.rc:root/meta_init.c2k.rc
endif


# Add FlashTool needed files
#PRODUCT_COPY_FILES += $(LOCAL_PATH)/EBR1:EBR1
#ifneq ($(wildcard $(LOCAL_PATH)/EBR2),)
#  PRODUCT_COPY_FILES += $(LOCAL_PATH)/EBR2:EBR2
#endif
#PRODUCT_COPY_FILES += $(LOCAL_PATH)/MBR:MBR
#PRODUCT_COPY_FILES += $(LOCAL_PATH)/MT6755_Android_scatter.txt:MT6755_Android_scatter.txt

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.sf.lcd_density=480

PRODUCT_COPY_FILES += $(LOCAL_PATH)/ht120.mtc:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/.ht120.mtc

ifneq ($(filter yes,$(MTK_PUMP_EXPRESS_PLUS_SUPPORT) $(MTK_PUMP_EXPRESS_PLUS_20_SUPPORT) $(MTK_PUMP_EXPRESS_PLUS_30_SUPPORT)),)
  ifeq ($(TARGET_BUILD_VARIANT),eng)
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal.eng.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/thermal.conf
  else
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/thermal.conf
  endif

  PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal.wfd.6750.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/.thermal_policy_00
  PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal.pip.6750.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/.thermal_policy_01
  PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal.fdvrgis.6750.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/.thermal_policy_02
  PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal.meta.6750.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/.thermal_meta.conf
else
  ifeq ($(TARGET_BUILD_VARIANT),eng)
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal.eng_noBCCT.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/thermal.conf
  else
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal_noBCCT.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/thermal.conf
  endif

  PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal.wfd.6750_noBCCT.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/.thermal_policy_00
  PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal.pip.6750_noBCCT.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/.thermal_policy_01
  PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal.fdvrgis.6750_noBCCT.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/.thermal_policy_02
  PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal.meta.6750_noBCCT.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/.thermal_meta.conf
endif


# alps/vendor/mediatek/proprietary/external/GeoCoding/Android.mk

# alps/vendor/mediatek/proprietary/frameworks-ext/native/etc/Android.mk

# touch related file for CTS
ifeq ($(strip $(CUSTOM_KERNEL_TOUCHPANEL)),generic)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml
else
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml
endif

# USB OTG
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml


# alps/external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/Android.mk
# PRODUCT_COPY_FILES += external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/driver/open_nfc_driver.ko:$(TARGET_COPY_OUT_VENDOR)/lib/open_nfc_driver.ko:mtk


# alps/mediatek/config/$project
PRODUCT_COPY_FILES += $(LOCAL_PATH)/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp

#PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapgrowthlimit=256m
#PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapsize=512m

# meta tool

# set Telephony property - SIM count
SIM_COUNT := 2

# Audio Related Resource
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/k50v1_64_bsp/factory/res/sound/testpattern1.wav:$(TARGET_COPY_OUT_VENDOR)/res/sound/testpattern1.wav:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/k50v1_64_bsp/factory/res/sound/ringtone.wav:$(TARGET_COPY_OUT_VENDOR)/res/sound/ringtone.wav:mtk


# Microphone
PRODUCT_COPY_FILES += $(LOCAL_PATH)/android.hardware.microphone.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.microphone.xml

# Camera
PRODUCT_COPY_FILES += $(LOCAL_PATH)/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml

# Audio Policy
PRODUCT_COPY_FILES += $(LOCAL_PATH)/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf:mtk

ifneq ($(MTK_AUDIO_TUNING_TOOL_VERSION),)
  ifneq ($(strip $(MTK_AUDIO_TUNING_TOOL_VERSION)),V1)
    AUDIO_PARAM_OPTIONS_LIST += SPK_PATH_INT=yes
    AUDIO_PARAM_OPTIONS_LIST += SPK_PATH_LO=no
    AUDIO_PARAM_OPTIONS_LIST += SPK_PATH_HP=no
    AUDIO_PARAM_OPTIONS_LIST += SPK_PATH_NO_ANA=no
  endif
endif

#Images for LCD test in factory mode
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/k50v1_64_bsp/factory/res/images/lcd_test_00.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_00.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/k50v1_64_bsp/factory/res/images/lcd_test_01.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_01.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/k50v1_64_bsp/factory/res/images/lcd_test_02.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_02.png:mtk





$(call inherit-product, device/mediatek/mt6755/device.mk)

$(call inherit-product-if-exists, vendor/mediatek/libs/$(MTK_TARGET_PROJECT)/device-vendor.mk)

