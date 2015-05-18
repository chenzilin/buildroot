################################################################################
#
# libbcm2835
#
################################################################################

LIBBCM2835_VERSION = 1.44
LIBBCM2835_SITE = http://www.open.com.au/mikem/bcm2835
LIBBCM2835_SOURCE = bcm2835-$(LIBBCM2835_VERSION).tar.gz
LIBBCM2835_LICENSE = GPLv2
LIBBCM2835_LICENSE_FILES = COPYING
LIBBCM2835_INSTALL_TARGET = YES
LIBBCM2835_INSTALL_STAGING = YES

LIBBCM2835_CONF_OPTS = \
	--disable-libssp \
	--disable-libgomp \
	--disable-multilib \
	--disable-libquadmath

define LIBBCM2835_INSTALL_STAGING_CMDS
	$(TARGET_CC) -shared $(@D)/src/bcm2835.o -o $(@D)/src/libbcm2835.so
	$(INSTALL) -D -m 0755 $(@D)/src/libbcm2835.so $(STAGING_DIR)/usr/lib/libbcm2835.so
	$(INSTALL) -D -m 0644 $(@D)/src/bcm2835.h $(STAGING_DIR)/usr/include/bcm2835.h
endef

define LIBBCM2835_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/src/libbcm2835.so $(TARGET_DIR)/usr/lib/libbcm2835.so
endef

$(eval $(autotools-package))
