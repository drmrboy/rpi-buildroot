################################################################################
#
# mkpasswd
#
################################################################################

# source included in buildroot, taken from
# https://github.com/rfc1036/whois/blob/master/
# at revision 5a0f08500fa51608b6d3b73ee338be38c692eadb
HOST_MKPASSWD_SOURCE =
HOST_MKPASSWD_LICENSE = GPLv2+

HOST_MKPASSWD_VERSION = buildroot-$(BR2_VERSION)

define HOST_MKPASSWD_BUILD_CMDS
	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
		package/mkpasswd/mkpasswd.c package/mkpasswd/utils.c \
		-o $(@D)/mkpasswd -lcrypt
endef

define HOST_MKPASSWD_INSTALL_CMDS
	$(INSTALL) -D -m 755 $(@D)/mkpasswd $(HOST_DIR)/usr/bin/mkpasswd
endef

$(eval $(host-generic-package))

MKPASSWD = $(HOST_DIR)/usr/bin/mkpasswd
