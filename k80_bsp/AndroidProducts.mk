PRODUCT_MAKEFILES := $(LOCAL_DIR)/full_k80_bsp.mk \
                     $(LOCAL_DIR)/vnd_k80_bsp.mk

COMMON_LUNCH_CHOICES:=\
    full_k80_bsp-eng \
    full_k80_bsp-userdebug \
    full_k80_bsp-user \
    vnd_k80_bsp-eng \
    vnd_k80_bsp-userdebug \
    vnd_k80_bsp-user
