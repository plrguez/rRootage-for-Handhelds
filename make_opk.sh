#!/bin/sh

OPK_NAME=rRootage_`date +'%Y%m%d'`.opk

echo ${OPK_NAME}

# create default.gcw0.desktop
cat > default.gcw0.desktop <<EOF
[Desktop Entry]
Name=rRootage
Comment=shoot things
Exec=./rr
Terminal=false
Type=Application
StartupNotify=true
Icon=rRootage
Categories=games;
EOF

cat > rrcfg.gcw0.desktop <<EOF
[Desktop Entry]
Name=rr config
Comment=config rRootage
Exec=./rr_cfg
Terminal=false
Type=Application
StartupNotify=true
Icon=rRootage
Categories=settings;
EOF

# create opk
FLIST="rr"
FLIST="${FLIST} custom_config_utility/rr_cfg"
FLIST="${FLIST} custom_config_utility/cfg"
FLIST="${FLIST} default.gcw0.desktop"
FLIST="${FLIST} rrcfg.gcw0.desktop"
FLIST="${FLIST} rRootage.png"
FLIST="${FLIST} rr_share"

rm -f ${OPK_NAME}
mksquashfs ${FLIST} ${OPK_NAME} -all-root -no-xattrs -noappend -no-exports

cat default.gcw0.desktop
rm -f default.gcw0.desktop
rm -f rrcfg.gcw0.desktop
