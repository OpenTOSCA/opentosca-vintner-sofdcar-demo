ASSETS="${TASK_ROOT_DIR}/assets"

VINTNER_VERSION_OLD=$(${TASK_BIN} vintner --version)

echo vintner-alpine-x64.xz
rm -f ${ASSETS}/vintner-alpine-x64.xz
rm -f ${ASSETS}/vintner-alpine-x64
wget https://github.com/OpenTOSCA/opentosca-vintner/releases/download/latest/vintner-alpine-x64.xz -P ${ASSETS}

echo
echo vintner-linux-arm64.xz
rm -f ${ASSETS}/vintner-linux-arm64.xz
rm -f ${ASSETS}/vintner-linux-arm64
wget https://github.com/OpenTOSCA/opentosca-vintner/releases/download/latest/vintner-linux-arm64.xz -P ${ASSETS}

echo
echo vintner-linux-x64.xz
rm -f ${ASSETS}/vintner-linux-x64.xz
rm -f ${ASSETS}/vintner-linux-x64
wget https://github.com/OpenTOSCA/opentosca-vintner/releases/download/latest/vintner-linux-x64.xz -P ${ASSETS}

echo
echo vintner-win-x64.exe.xz
rm -f ${ASSETS}/vintner-win-x64.exe.xz
rm -f ${ASSETS}/vintner-win-x64.exe
wget https://github.com/OpenTOSCA/opentosca-vintner/releases/download/latest/vintner-win-x64.exe.xz -P ${ASSETS}

VINTNER_VERSION_NEW=$(${TASK_BIN} vintner --version)

echo
echo old version: ${VINTNER_VERSION_OLD}
echo new version: ${VINTNER_VERSION_NEW}

sed -i "s/${VINTNER_VERSION_OLD}/${VINTNER_VERSION_NEW}/" ${TASK_ROOT_DIR}/README.md
