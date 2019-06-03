FILESEXTRAPATHS_append := ":${THISDIR}/weston"

SRC_URI_append = "file://weston-seats.rules"

FILES_${PN} += " \
    ${sysconfdir}/udev/rules.d/weston-seats.rules \
"

do_install_append_r8a7795() {
    # DomU based product doesn't need transform
    if echo "${XT_GUESTS_INSTALL}" | grep -qi "domu";then
        sed -e '$a\\' \
            -e '$a\[output]' \
            -e '$a\name=HDMI-A-1' \
            -i ${D}/${sysconfdir}/xdg/weston/weston.ini
    else
        sed -e '$a\\' \
            -e '$a\[output]' \
            -e '$a\name=HDMI-A-1' \
            -e '$a\transform=0' \
            -i ${D}/${sysconfdir}/xdg/weston/weston.ini
    fi

    install -d ${D}${sysconfdir}/udev/rules.d
    install -m 0644 ${WORKDIR}/weston-seats.rules ${D}${sysconfdir}/udev/rules.d/weston-seats.rules
}

do_install_append_r8a7795() {
    sed -e '$a\\' \
        -e '$a\[output]' \
        -e '$a\name=HDMI-A-2' \
        -e '$a\transform=0' \
        -i ${D}/${sysconfdir}/xdg/weston/weston.ini

    # DomU based product does need VGA-1 enabled
    if echo "${XT_GUESTS_INSTALL}" | grep -qi "domu";then
        sed -e '$a\\' \
            -e '$a\[output]' \
            -e '$a\name=VGA-1' \
            -i ${D}/${sysconfdir}/xdg/weston/weston.ini
    else
        sed -e '$a\\' \
            -e '$a\[output]' \
            -e '$a\name=VGA-1' \
            -e '$a\mode=off' \
            -i ${D}/${sysconfdir}/xdg/weston/weston.ini
    fi
}

do_install_append_r8a7796() {
    sed -e '$a\\' \
        -e '$a\[output]' \
        -e '$a\name=HDMI-A-1' \
        -i ${D}/${sysconfdir}/xdg/weston/weston.ini

    install -d ${D}${sysconfdir}/udev/rules.d
    install -m 0644 ${WORKDIR}/weston-seats.rules ${D}${sysconfdir}/udev/rules.d/weston-seats.rules
}

do_install_append_r8a7796() {
    # DomU based product doesn't need transform
    if echo "${XT_GUESTS_INSTALL}" | grep -qi "domu";then
        sed -e '$a\\' \
            -e '$a\[output]' \
            -e '$a\name=VGA-1' \
            -i ${D}/${sysconfdir}/xdg/weston/weston.ini
    else
        sed -e '$a\\' \
            -e '$a\[output]' \
            -e '$a\name=VGA-1' \
            -e '$a\transform=0' \
            -i ${D}/${sysconfdir}/xdg/weston/weston.ini
    fi
}
