# TARGET #

TARGET := 3DS
LIBRARY := 0

ifeq ($(TARGET),3DS)
    ifeq ($(strip $(DEVKITPRO)),)
        $(error "Please set DEVKITPRO in your environment. export DEVKITPRO=<path to>devkitPro")
    endif

    ifeq ($(strip $(DEVKITARM)),)
        $(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
    endif
endif

# COMMON CONFIGURATION #

NAME := Blobs

BUILD_DIR := build
OUTPUT_DIR := output
INCLUDE_DIRS := include
SOURCE_DIRS := source

BUILD_FILTER := source/svchax/test/test.c

EXTRA_OUTPUT_FILES :=

LIBRARY_DIRS := $(DEVKITPRO)/libctru
LIBRARIES := citro3d ctru m

BUILD_FLAGS := -DLIBKHAX_AS_LIB -DVERSION_STRING="\"`git describe --tags --abbrev=0`\""
RUN_FLAGS :=

# 3DS CONFIGURATION #

TITLE := $(NAME)
DESCRIPTION := Blobs.
AUTHOR := Steveice10
PRODUCT_CODE := HYT-P-BLOB
UNIQUE_ID := 0xF8866
BUILD_FLAGS += -O3 -DUNIQUE_ID=$(UNIQUE_ID) -fno-exceptions -ffunction-sections -Wsign-compare

SYSTEM_MODE := 64MB
SYSTEM_MODE_EXT := Legacy

ICON_FLAGS := --flags visible,ratingrequired,recordusage --cero 153 --esrb 153 --usk 153 --pegigen 153 --pegiptr 153 --pegibbfc 153 --cob 153 --grb 153 --cgsrr 153

ROMFS_DIR := romfs
BANNER_AUDIO := meta/audio.wav
BANNER_IMAGE := meta/banner.cgfx
ICON := meta/icon.png

# INTERNAL #

include buildtools/make_base
