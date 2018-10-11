################################################################################
#
# WPEFramework Plugins
#
################################################################################

WPEFRAMEWORK_PLUGINS_VERSION = 0ca9f95f1160ceff21162bcc875dbf9ac6e544bc
WPEFRAMEWORK_PLUGINS_SITE = $(call github,WebPlatformForEmbedded,WPEFrameworkPlugins,$(WPEFRAMEWORK_PLUGINS_VERSION))
WPEFRAMEWORK_PLUGINS_INSTALL_STAGING = YES
WPEFRAMEWORK_PLUGINS_DEPENDENCIES = wpeframework libpng

WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DBUILD_REFERENCE=${WPEFRAMEWORK_PLUGINS_VERSION}

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_DEBUG),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Debug
endif

# libprovision

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_COMMANDER),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMMANDER=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_DEVICEINFO),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_DEVICEINFO=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_DHCPSERVER),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_DHCPSERVER=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_DICTIONARY),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_DICTIONARY=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_EGLTEST),y)
WPEFRAMEWORK_COMMON_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_EGLTEST=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_LOCATIONSYNC),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_LOCATIONSYNC=ON
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_LOCATIONSYNC_URI=${BR2_PACKAGE_WPEFRAMEWORK_LOCATIONSYNC_URI}
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_MONITOR),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_MONITOR=ON
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_MONITOR_WEBKIT),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_MEMORYLIMIT=${BR2_PACKAGE_WPEFRAMEWORK_MONITOR_WEBKIT}
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_MONITOR_YOUTUBE),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_YOUTUBE_MEMORYLIMIT=${BR2_PACKAGE_WPEFRAMEWORK_MONITOR_YOUTUBE}
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_MONITOR_APPS),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_APPS_MEMORYLIMIT=${BR2_PACKAGE_WPEFRAMEWORK_MONITOR_APPS}
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_MONITOR_UX),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_UX_MEMORYLIMIT=${BR2_PACKAGE_WPEFRAMEWORK_MONITOR_UX}
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_MONITOR_NETFLIX),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_NETFLIX=ON
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_NETFLIX_MEMORYLIMIT=${BR2_PACKAGE_WPEFRAMEWORK_MONITOR_NETFLIX}
endif
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_NETWORKCONTROL),y)
ifeq ($(BR2_TARGET_GENERIC_NETWORK),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DPLUGIN_NETWORKCONTROL_SYSTEM_NETWORK=ON
endif
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_NETWORKCONTROL=ON
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_OPENCDMI=ON
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_OPENCDMI_AUTOSTART=true
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_OPENCDMI_OOP=true
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_USER),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_OPENCDMI_USER=$(BR2_PACKAGE_WPEFRAMEWORK_CDMI_USER)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_GROUP),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_OPENCDMI_GROUP=$(BR2_PACKAGE_WPEFRAMEWORK_CDMI_GROUP)
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_CLEARKEY),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DPLUGIN_OPENCDMI_CLEARKEY=ON
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += wpeframework-cdmi-clearkey
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_PLAYREADY),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DPLUGIN_OPENCDMI_PLAYREADY=ON
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += wpeframework-cdmi-playready
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_PLAYREADY_NEXUS),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DPLUGIN_OPENCDMI_PLAYREADY_NEXUS=ON
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += wpeframework-cdmi-playready-nexus
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_PLAYREADY_NEXUS_SVP),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DPLUGIN_OPENCDMI_PLAYREADY_NEXUS=ON
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += wpeframework-cdmi-playready-nexus-svp
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_PLAYREADY_VGDRM),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DPLUGIN_OPENCDMI_PLAYREADY_VGDRM=ON
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += wpeframework-cdmi-playready-vgdrm
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_WIDEVINE),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DPLUGIN_OPENCDMI_WIDEVINE=ON
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += wpeframework-cdmi-widevine
endif
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_BLUETOOTH),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_BLUETOOTH=ON
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_BLUETOOTH_AUTOSTART=true
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_BLUETOOTH_OOP=true
ifeq ($(BR2_PACKAGE_RPI_FIRMWARE),y)
WPEFRAMEWORK_PLUGINS_POST_INSTALL_TARGET_HOOKS += WPEFRAMEWORK_BLUETOOTH_POST_TARGET_INITD
define WPEFRAMEWORK_BLUETOOTH_POST_TARGET_INITD
    mkdir -p $(TARGET_DIR)/etc/init.d
    $(INSTALL) -D -m 0755 package/wpe/wpeframework-plugins/S35WPEFrameworkBluetooth $(TARGET_DIR)/etc/init.d
endef
endif
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_REMOTECONTROL),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_REMOTECONTROL=ON
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_REMOTECONTROL_DEVINPUT),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_REMOTECONTROL_DEVINPUT=ON
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += udev
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_REMOTECONTROL_IR),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_REMOTECONTROL_IR=ON
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_REMOTECONTROL_IR_CODEMASK),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_REMOTECONTROL_CODEMASK="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_REMOTECONTROL_IR_CODEMASK))"
endif
endif
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_SNAPSHOT),y)
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += libpng
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_SNAPSHOT=ON
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_TIMESYNC),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_TIMESYNC=ON
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_TRACECONTROL),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_TRACECONTROL=ON
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER),y)
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += wpewebkit
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER=ON
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_AUTOSTART),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_AUTOSTART=true
else
WPEFRAMEWORK_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_AUTOSTART=false
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_STARTURL),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_STARTURL=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_STARTURL)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_USERAGENT),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_USERAGENT=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_USERAGENT)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_MEMORYPROFILE),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_MEMORYPROFILE=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_MEMORYPROFILE)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_MEMORYPRESSURE),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_MEMORYPRESSURE=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_MEMORYPRESSURE)
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_MEDIADISKCACHE),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_MEDIADISKCACHE=true
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_DISKCACHE),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_DISKCACHE=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_DISKCACHE)
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_XHRCACHE),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_XHRCACHE=false
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_CLIENTIDENTIFIER),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_CLIENTIDENTIFIER=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_CLIENTIDENTIFIER)
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_TRANSPARENT),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_TRANSPARENT=true
else
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_TRANSPARENT=false
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_THREADEDPAINTING),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_THREADEDPAINTING=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_THREADEDPAINTING)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_USER),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_USER=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_USER)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_GROUP),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_GROUP=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_GROUP)
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_YOUTUBE),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_YOUTUBE=ON
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_YOUTUBE_USERAGENT),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_YOUTUBE_USERAGENT=$(BR2_PACKAGE_WPEFRAMEWORK_YOUTUBE_USERAGENT)
endif
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_APPS),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_APPS=ON
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_APPS_AUTOSTART),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_APPS_AUTOSTART=true
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_APPS_USERAGENT),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_APPS_USERAGENT=$(BR2_PACKAGE_WPEFRAMEWORK_APPS_USERAGENT)
endif
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_UX),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_UX=ON
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_UX_AUTOSTART),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_UX_AUTOSTART=true
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_UX_USERAGENT),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_UX_USERAGENT=$(BR2_PACKAGE_WPEFRAMEWORK_UX_USERAGENT)
endif
endif
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBPROXY),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBPROXY=ON
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBSERVER),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBSERVER=ON
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBSERVER_PATH),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_WEBSERVER_PATH=$(BR2_PACKAGE_WPEFRAMEWORK_WEBSERVER_PATH)
endif
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBSHELL),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBSHELL=ON
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WIFICONTROL),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WIFICONTROL=ON
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_TVCONTROL),y)
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += sqlite
ifeq ($(BR2_PACKAGE_RPI_FIRMWARE), y)
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += dvb-apps
endif
ifeq ($(BR2_PACKAGE_TVPLATFORM_BCM), y)
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += wpetvplatform-bcm
else ifeq ($(BR2_PACKAGE_TVPLATFORM_LINUXTV), y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DPLUGIN_TVCONTROL_LINUXTV=ON
endif
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_TVCONTROL=ON
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGINS_TVCONTROL_HOME_TS=$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_HOME_TS))
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGINS_TVCONTROL_FREQUENCY_LIST=$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PLUGINS_TVCONTROL_FREQUENCY_LIST))

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_TVCONTROL_DVB),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_TVCONTROL_DVB=true
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGINS_TVCONTROL_COUNTRY_CODE=$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PLUGINS_TVCONTROL_COUNTRY_CODE))
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGINS_TVCONTROL_COUNTRY_REGION_ID=$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PLUGINS_TVCONTROL_COUNTRY_REGION_ID))

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_TVCONTROL_ENABLE_BOUQUET_PARSING), y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_TVCONTROL_ENABLE_BOUQUET_PARSING=true
endif

ifeq ($(BR2_PACKAGE_BCM_REFSW), y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGINS_TVCONTROL_TUNE_PARAM=$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PLUGINS_TVCONTROL_TUNE_PARAM))
endif
else
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_TVCONTROL_DVB=false
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_TVCONTROL_DVB),y)
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += dvb-apps
endif
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_RPCLINK),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_RPCLINK=ON
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR=ON
ifeq ($(BR2_PACKAGE_WESTEROS),y)
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += westeros
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_IMPLEMENTATION=Wayland
else ifeq  ($(BR2_PACKAGE_BCM_REFSW),y)
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += bcm-refsw
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_IMPLEMENTATION=Nexus
else ifeq  ($(BR2_PACKAGE_HAS_NEXUS),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_IMPLEMENTATION=Nexus
else ifeq  ($(BR2_PACKAGE_RPI_FIRMWARE),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_IMPLEMENTATION=RPI
else
$(error Missing a compositor implemtation, please provide one or disable WPEFRAMEWORK_PLUGIN_COMPOSITOR)
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_OUTOFPROCESS),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_OUTOFPROCESS=true
else
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_OUTOFPROCESS=false
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_AUTOSTART),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_AUTOSTART=true
else
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_AUTOSTART=false
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_NEXUS_SERVER),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_NXSERVER=ON
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_IRMODE),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_IRMODE="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_IRMODE))"
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_BOXMODE),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_BOXMODE="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_BOXMODE))"
endif
ifneq ($(BR2_PACKAGE_BCM_REFSW_SAGE_PATH),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_SAGE_PATH="$(call qstrip,$(BR2_PACKAGE_BCM_REFSW_SAGE_PATH))"
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_SVP_NONE),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_SVP="None"
else ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_SVP_VIDEO),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_SVP="Video"
else ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_SVP_ALL),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_SVP="All"
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_MEMORY_GFX),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_MEMORY_GFX="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_MEMORY_GFX))"
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_MEMORY_GFX2),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_MEMORY_GFX2="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_MEMORY_GFX2))"
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_MEMORY_RESTRICTED),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_MEMORY_RESTRICTED="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_MEMORY_RESTRICTED))"
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_MEMORY_MAIN),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_MEMORY_MAIN="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_MEMORY_MAIN))"
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_MEMORY_EXPORT),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_MEMORY_EXPORT="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_MEMORY_EXPORT))"
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_MEMORY_SECUREGFX),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_MEMORY_SECUREGFX="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_MEMORY_SECUREGFX))"
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_MEMORY_CLIENT),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_MEMORY_CLIENT="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_MEMORY_CLIENT))"
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_ALLOW_UNAUTHENTICATED_CLIENTS),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_ALLOW_UNAUTHENTICATED_CLIENTS=false
else
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_ALLOW_UNAUTHENTICATED_CLIENTS=true
endif
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_VIRTUALINPUT),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_VIRTUALINPUT=ON
endif

WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMPOSITOR_HARDWAREREADY=${BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR_HARDWAREREADY}

define WPEFRAMEWORK_COMPOSITOR_POST_TARGET_REMOVE_HEADERS
    rm -rf $(TARGET_DIR)/usr/include/WPEFramework
endef

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_INSTALL_HEADERS),y)
WPEFRAMEWORK_PLUGINS_POST_INSTALL_TARGET_HOOKS += WPEFRAMEWORK_COMPOSITOR_POST_TARGET_REMOVE_HEADERS
endif

endif

$(eval $(cmake-package))
