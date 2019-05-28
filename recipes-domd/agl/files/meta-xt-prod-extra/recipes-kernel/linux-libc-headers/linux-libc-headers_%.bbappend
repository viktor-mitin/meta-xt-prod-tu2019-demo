RENESAS_BSP_URL = "git://github.com/xen-troops/linux.git"

BRANCH = "master"
SRCREV = "${AUTOREV}"
LINUX_VERSION = "4.14.75"

SRC_URI = "${RENESAS_BSP_URL};protocol=git;branch=${BRANCH}"
