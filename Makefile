THEOS_DEVICE_IP = iphone-de-greg.local

INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = armv7 arm64
GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RaiseLight

RaiseLight_FILES = Tweak.x
RaiseLight_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
