LOCAL_PATH := $(call my-dir)
include $(LOCAL_PATH)/../common.mk

# Export QService headers
include $(CLEAR_VARS)
LOCAL_MODULE := qservice_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)
LOCAL_VENDOR_MODULE := true
include $(BUILD_HEADER_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libqservice
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := $(common_includes)
LOCAL_SHARED_LIBRARIES := $(common_libs) libbinder
LOCAL_CFLAGS := $(common_flags) -DLOG_TAG=\"qdqservice\"
LOCAL_CFLAGS += -Wno-error
LOCAL_HEADER_LIBRARIES := generated_kernel_headers qservice_headers
LOCAL_SRC_FILES := QService.cpp \
                   IQService.cpp \
                   IQClient.cpp

include $(BUILD_SHARED_LIBRARY)
