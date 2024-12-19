##		ffwsn-site.mk

DEFAULT_GLUON_RELEASE := ffwsn-v053


# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)
# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

# Default priority for updates.
GLUON_PRIORITY ?= 0

# Languages to include
GLUON_LANGS ?= en de

GLUON_MULTIDOMAIN=0

# build images for deprecated devices (e.g. ar71xx-tiny)
GLUON_DEPRECATED ?= 0
