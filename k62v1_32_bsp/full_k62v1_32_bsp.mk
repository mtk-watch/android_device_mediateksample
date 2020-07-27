SYS_TARGET_PROJECT := mssi_32_cn
SYS_TARGET_PROJECT_FOLDER := device/mediatek/system/$(SYS_TARGET_PROJECT)
MTK_TARGET_PROJECT := k62v1_32_bsp
MTK_TARGET_PROJECT_FOLDER := $(LOCAL_PATH)

-include $(SYS_TARGET_PROJECT_FOLDER)/sys_$(SYS_TARGET_PROJECT).mk
-include $(MTK_TARGET_PROJECT_FOLDER)/vnd_$(MTK_TARGET_PROJECT).mk

PRODUCT_NAME := full_k62v1_32_bsp

