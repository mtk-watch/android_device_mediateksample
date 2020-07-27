PRODUCT_COPY_FILES += $(LOCAL_PATH)/factory_init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/factory_init.project.rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.project.rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/meta_init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/meta_init.project.rc


PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=320

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



# alps/mediatek/config/$project
PRODUCT_COPY_FILES += $(LOCAL_PATH)/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml

# Set default USB interface


# meta tool


# Audio Related Resource
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/k61v1_hdp_ref/factory/res/sound/testpattern1.wav:$(TARGET_COPY_OUT_VENDOR)/res/sound/testpattern1.wav:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/k61v1_hdp_ref/factory/res/sound/ringtone.wav:$(TARGET_COPY_OUT_VENDOR)/res/sound/ringtone.wav:mtk


# Microphone
PRODUCT_COPY_FILES += $(LOCAL_PATH)/android.hardware.microphone.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.microphone.xml

# Camera
PRODUCT_COPY_FILES += $(LOCAL_PATH)/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml

# Audio Policy
PRODUCT_COPY_FILES += $(LOCAL_PATH)/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf:mtk

# Compass sensor
PRODUCT_COPY_FILES += $(LOCAL_PATH)/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml:mtk

#Images for LCD test in factory mode
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/k61v1_hdp_ref/factory/res/images/lcd_test_00.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_00.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/k61v1_hdp_ref/factory/res/images/lcd_test_01.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_01.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/k61v1_hdp_ref/factory/res/images/lcd_test_02.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_02.png:mtk

# F2FS filesystem
PRODUCT_PROPERTY_OVERRIDES += ro.vendor.mtk_f2fs_enable=1




$(call inherit-product, device/mediatek/mt6761/device.mk)

PRODUCT_COPY_FILES +=  $(LOCAL_PATH)/libs/fingerprint/bin/hw/vendor.sw.swfingerprint@1.0-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/vendor.sw.swfingerprint@1.0-service
PRODUCT_COPY_FILES +=  $(LOCAL_PATH)/libs/fingerprint/bin/sf_ta:$(TARGET_COPY_OUT_VENDOR)/bin/sf_ta
PRODUCT_COPY_FILES +=  $(LOCAL_PATH)/libs/fingerprint/etc/init/vendor.sw.swfingerprint@1.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.sw.swfingerprint@1.0-service.rc

PRODUCT_COPY_FILES +=  $(LOCAL_PATH)/libs/fingerprint/lib/vendor.sw.swfingerprint@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib/vendor.sw.swfingerprint@1.0.so
PRODUCT_COPY_FILES +=  $(LOCAL_PATH)/libs/fingerprint/lib/hw/swfingerprint.default.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/swfingerprint.default.so
PRODUCT_COPY_FILES +=  $(LOCAL_PATH)/libs/fingerprint/lib/hw/vendor.sw.swfingerprint@1.0-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/vendor.sw.swfingerprint@1.0-impl.so

PRODUCT_PACKAGES += android.hardware.biometrics.fingerprint@2.1-service


$(call inherit-product-if-exists, vendor/mediatek/libs/$(MTK_TARGET_PROJECT)/device-vendor.mk)



