SYS_TARGET_PROJECT := mssi_32_ago_ww
SYS_TARGET_PROJECT_FOLDER := device/mediatek/system/$(SYS_TARGET_PROJECT)
MTK_TARGET_PROJECT := k37mv1_bsp_512
MTK_TARGET_PROJECT_FOLDER := $(LOCAL_PATH)

-include $(SYS_TARGET_PROJECT_FOLDER)/sys_$(SYS_TARGET_PROJECT).mk
-include $(MTK_TARGET_PROJECT_FOLDER)/vnd_$(MTK_TARGET_PROJECT).mk

PRODUCT_NAME := full_k37mv1_bsp_512

