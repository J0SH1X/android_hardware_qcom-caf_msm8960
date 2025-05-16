ifeq ($(call my-dir),$(call project-path-for,qcom-display))


display-hals := libgralloc libgenlock libcopybit 
display-hals += libhwcomposer liboverlay libqdutils libexternal libqservice
display-hals += libmemtrack
ifneq ($(TARGET_PROVIDES_LIBLIGHT),true)
display-hals += liblight
endif

ifneq (,$(filter $(QCOM_BOARD_PLATFORMS),$(TARGET_BOARD_PLATFORM)))
    include $(call all-named-subdir-makefiles,$(display-hals))
else
ifneq ($(filter msm8226 msm8x26 msm8960 msm8974 msm8x74,$(TARGET_BOARD_PLATFORM)),)
    #This is for mako since it doesn't have the QCOM make functions
    include $(call all-named-subdir-makefiles,$(display-hals))
endif
endif

include $(CLEAR_VARS)
LOCAL_MODULE := display_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := \
    hardware/qcom-caf/msm8960/display/libcopybit \
    hardware/qcom-caf/msm8960/display/libexternal \
    hardware/qcom-caf/msm8960/display/libgralloc \
    hardware/qcom-caf/msm8960/display/libhdmi \
    hardware/qcom-caf/msm8960/display/libhwcomposer \
    hardware/qcom-caf/msm8960/display/liboverlay \
    hardware/qcom-caf/msm8960/display/libqdutils \
    hardware/qcom-caf/msm8960/display/libqservice \
include $(BUILD_HEADER_LIBRARY)

endif
