INSTALL_TARGET_PROCESSES = SpringBoard
PACKAGE_VERSION=$(THEOS_PACKAGE_BASE_VERSION)
SYSROOT = $(THEOS)/sdks/iPhoneOS11.2.sdk
export ARCHS=arm64 arm64e
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Docky

Docky_FILES = Docky.xm
Docky_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += dockyprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
