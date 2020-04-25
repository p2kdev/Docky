include $(THEOS)/makefiles/common.mk

PACKAGE_VERSION=$(THEOS_PACKAGE_BASE_VERSION)
BUNDLE_NAME = DockyPrefs
SYSROOT = $(THEOS)/sdks/iPhoneOS11.2.sdk
DockyPrefs_FILES = NCDRootListController.m
DockyPrefs_INSTALL_PATH = /Library/PreferenceBundles
DockyPrefs_FRAMEWORKS = UIKit
DockyPrefs_PRIVATE_FRAMEWORKS = Preferences
DockyPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/DockyPrefs.plist$(ECHO_END)
