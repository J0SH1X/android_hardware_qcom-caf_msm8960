LOCAL_PATH := $(call my-dir)
include $(LOCAL_PATH)/../common.mk

# Header export module for liboverlay headers
include $(CLEAR_VARS)
LOCAL_MODULE := liboverlay_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)
LOCAL_VENDOR_MODULE := true
include $(BUILD_HEADER_LIBRARY)

# Shared library: liboverlay
include $(CLEAR_VARS)

LOCAL_MODULE := liboverlay
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_TAGS := optional

LOCAL_C_INCLUDES := $(common_includes)

LOCAL_SHARED_LIBRARIES := $(common_libs) libqdutils libmemalloc libsync

LOCAL_CFLAGS := $(common_flags) -DLOG_TAG=\"qdoverlay\"

LOCAL_HEADER_LIBRARIES := \
    generated_kernel_headers \
    gralloc_headers \
    libqd_headers \
    liboverlay_headers

LOCAL_SRC_FILES := \
    overlay.cpp \
    overlayUtils.cpp \
    overlayMdp.cpp \
    overlayRotator.cpp \
    overlayMdpRot.cpp \
    overlayMdssRot.cpp \
    pipes/overlayGenPipe.cpp

include $(BUILD_SHARED_LIBRARY)
