

#For GMO to reduce runtime memroy usage
ifeq (yes,$(strip $(MTK_GMO_RAM_OPTIMIZE)))

ifneq (yes,$(strip $(MTK_BASIC_PACKAGE)))
ifneq (yes,$(strip $(MTK_BSP_PACKAGE)))
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.hwui.path_cache_size=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.hwui.text_small_cache_width=512
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.hwui.text_small_cache_height=256
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.hwui.disable_asset_atlas=true
endif
endif

# Disable fast starting window in GMO project



PRODUCT_COPY_FILES += device/mediatek/common/fstab.enableswap_gmo:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/enableswap.sh

#end of For GMO to reduce runtime memroy usage
endif

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.sf.lcd_density=320

# PRODUCT_COPY_FILES += device/mediateksample/k39tv1_bsp/egl.cfg:$(TARGET_COPY_OUT_VENDOR)/lib/egl/egl.cfg:mtk
# PRODUCT_COPY_FILES += device/mediateksample/k39tv1_bsp/ueventd.mt6739.rc:root/ueventd.mt6739.rc

PRODUCT_COPY_FILES += device/mediateksample/k39tv1_bsp/factory_init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/factory_init.project.rc
PRODUCT_COPY_FILES += device/mediateksample/k39tv1_bsp/init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.project.rc
PRODUCT_COPY_FILES += device/mediateksample/k39tv1_bsp/meta_init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/meta_init.project.rc

ifeq ($(MTK_SMARTBOOK_SUPPORT),yes)
PRODUCT_COPY_FILES += device/mediateksample/k39tv1_bsp/sbk-kpd.kl:system/usr/keylayout/sbk-kpd.kl:mtk \
                      device/mediateksample/k39tv1_bsp/sbk-kpd.kcm:system/usr/keychars/sbk-kpd.kcm:mtk
endif

# Add FlashTool needed files
#PRODUCT_COPY_FILES += device/mediateksample/$(MTK_TARGET_PROJECT)/EBR1:EBR1
#ifneq ($(wildcard device/mediateksample/$(MTK_TARGET_PROJECT)/EBR2),)
#  PRODUCT_COPY_FILES += device/mediateksample/$(MTK_TARGET_PROJECT)/EBR2:EBR2
#endif
#PRODUCT_COPY_FILES += device/mediateksample/$(MTK_TARGET_PROJECT)/MBR:MBR
#PRODUCT_COPY_FILES += device/mediateksample/$(MTK_TARGET_PROJECT)/MT6739_Android_scatter.txt:MT6739_Android_scatter.txt





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

# GPS relative file
ifeq ($(MTK_GPS_SUPPORT),yes)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml
endif

# alps/external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/Android.mk
# PRODUCT_COPY_FILES += external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/driver/open_nfc_driver.ko:$(TARGET_COPY_OUT_VENDOR)/lib/open_nfc_driver.ko:mtk

# alps/frameworks/av/media/libeffects/factory/Android.mk
PRODUCT_COPY_FILES += frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf

# alps/mediatek/config/$project
PRODUCT_COPY_FILES += device/mediateksample/k39tv1_bsp/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml


# Set default USB interface

#PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapgrowthlimit=256m
#PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapsize=512m

# meta tool

# set Telephony property - SIM count
SIM_COUNT := 2

# Audio Related Resource
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/k39tv1_bsp/factory/res/sound/testpattern1.wav:$(TARGET_COPY_OUT_VENDOR)/res/sound/testpattern1.wav:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/k39tv1_bsp/factory/res/sound/ringtone.wav:$(TARGET_COPY_OUT_VENDOR)/res/sound/ringtone.wav:mtk

# Keyboard layout
PRODUCT_COPY_FILES += device/mediatek/mt6739/ACCDET.kl:system/usr/keylayout/ACCDET.kl:mtk
PRODUCT_COPY_FILES += device/mediateksample/k39tv1_bsp/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl:mtk

# Microphone
PRODUCT_COPY_FILES += device/mediateksample/k39tv1_bsp/android.hardware.microphone.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.microphone.xml

# Camera
PRODUCT_COPY_FILES += device/mediateksample/k39tv1_bsp/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml

# Audio Policy
PRODUCT_COPY_FILES += device/mediateksample/k39tv1_bsp/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf:mtk


#Images for LCD test in factory mode
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/k39tv1_bsp/factory/res/images/lcd_test_00.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_00.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/k39tv1_bsp/factory/res/images/lcd_test_01.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_01.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/k39tv1_bsp/factory/res/images/lcd_test_02.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_02.png:mtk


# overlay has priorities. high <-> low.

DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/sd_in_ex_otg

DEVICE_PACKAGE_OVERLAYS += device/mediateksample/k39tv1_bsp/overlay
ifdef OPTR_SPEC_SEG_DEF
  ifneq ($(strip $(OPTR_SPEC_SEG_DEF)),NONE)
    OPTR := $(word 1,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    SPEC := $(word 2,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    SEG  := $(word 3,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/operator/$(OPTR)/$(SPEC)/$(SEG)
  endif
endif
ifneq (yes,$(strip $(MTK_TABLET_PLATFORM)))
  ifeq (480,$(strip $(LCM_WIDTH)))
    ifeq (854,$(strip $(LCM_HEIGHT)))
      DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/FWVGA
    endif
  endif
  ifeq (540,$(strip $(LCM_WIDTH)))
    ifeq (960,$(strip $(LCM_HEIGHT)))
      DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/qHD
    endif
  endif
endif
ifeq (yes,$(strip $(MTK_GMO_ROM_OPTIMIZE)))
  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/slim_rom
endif
ifeq (yes,$(strip $(MTK_GMO_RAM_OPTIMIZE)))
  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/slim_ram
endif


$(call inherit-product, device/mediatek/mt6739/device.mk)

$(call inherit-product-if-exists, vendor/mediatek/libs/$(MTK_TARGET_PROJECT)/device-vendor.mk)



