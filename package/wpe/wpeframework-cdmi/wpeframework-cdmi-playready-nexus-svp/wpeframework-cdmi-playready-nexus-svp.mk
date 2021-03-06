################################################################################
#
# wpeframework-cdmi-playready-nexus-svp
#
################################################################################

WPEFRAMEWORK_CDMI_PLAYREADY_NEXUS_SVP_VERSION = d0a4d4eae54ba5bdfac26090e16fa4145c3ed6b1
WPEFRAMEWORK_CDMI_PLAYREADY_NEXUS_SVP_SITE_METHOD = git
WPEFRAMEWORK_CDMI_PLAYREADY_NEXUS_SVP_SITE = git@github.com:WebPlatformForEmbedded/OCDM-Playready-Nexus-SVP.git
WPEFRAMEWORK_CDMI_PLAYREADY_NEXUS_SVP_INSTALL_STAGING = YES
WPEFRAMEWORK_CDMI_PLAYREADY_NEXUS_SVP_DEPENDENCIES = wpeframework

ifeq ($(BR2_PACKAGE_BCM_REFSW),y)
WPEFRAMEWORK_CDMI_PLAYREADY_NEXUS_SVP_DEPENDENCIES += bcm-refsw
endif

define WPEFRAMEWORK_CDMI_PLAYREADY_NEXUS_SVP_INSTALL_PLAYREADY_PC_FILE
	$(INSTALL) -m 0644 -D $(@D)/playready_3.0.pc $(STAGING_DIR)/usr/lib/pkgconfig/playready.pc
endef

define WPEFRAMEWORK_CDMI_PLAYREADY_NEXUS_SVP_INSTALL_OCDM_PC_FILE
	$(INSTALL) -m 0644 -D $(@D)/ocdm-nexus.pc $(STAGING_DIR)/usr/lib/pkgconfig/ocdm-nexus.pc
endef

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_PLAYREADY_NEXUS_SVP_ENABLE),y)
WPEFRAMEWORK_CDMI_PLAYREADY_NEXUS_SVP_CONF_OPTS += -DNEXUS_PLAYREADY_SVP_ENABLE=ON
endif

WPEFRAMEWORK_CDMI_PLAYREADY_NEXUS_SVP_POST_EXTRACT_HOOKS += \
	WPEFRAMEWORK_CDMI_PLAYREADY_NEXUS_SVP_INSTALL_PLAYREADY_PC_FILE \
	WPEFRAMEWORK_CDMI_PLAYREADY_NEXUS_SVP_INSTALL_OCDM_PC_FILE

$(eval $(cmake-package))
