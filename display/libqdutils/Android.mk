LOCAL_PATH := $(call my-dir)

include $(LOCAL_PATH)/../common.mk

# Export headers from libqdutils and libqdMetaData
include $(CLEAR_VARS)
LOCAL_MODULE := libqd_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)
LOCAL_VENDOR_MODULE := true
include $(BUILD_HEADER_LIBRARY)

# libqdutils shared library
include $(CLEAR_VARS)

LOCAL_MODULE := libqdutils
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
LOCAL_SHARED_LIBRARIES := $(common_libs) libbinder libqservice libui libhardware
LOCAL_C_INCLUDES := $(common_includes)
LOCAL_CFLAGS := $(common_flags) -DLOG_TAG=\"qdutils\"
LOCAL_HEADER_LIBRARIES := generated_kernel_headers libqd_headers gralloc_headers qservice_headers hwcomposer_headers
LOCAL_SRC_FILES := profiler.cpp mdp_version.cpp \
                   idle_invalidator.cpp \
                   comptype.cpp display_config.cpp \
                   cb_utils.cpp
include $(BUILD_SHARED_LIBRARY)

# libqdMetaData shared library
include $(CLEAR_VARS)

LOCAL_MODULE := libqdMetaData
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
LOCAL_SHARED_LIBRARIES := liblog libcutils libhardware
LOCAL_C_INCLUDES := $(common_includes)
LOCAL_HEADER_LIBRARIES := generated_kernel_headers libqd_headers
LOCAL_SRC_FILES := qdMetaData.cpp
LOCAL_CFLAGS := $(common_flags) -DLOG_TAG=\"DisplayMetaData\"
include $(BUILD_SHARED_LIBRARY)
