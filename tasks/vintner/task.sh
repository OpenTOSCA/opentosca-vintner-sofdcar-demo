ASSETS="${TASK_ROOT_DIR}/assets"

VINTNER="${ASSETS}/vintner-linux-x64"
if [ "$(uname)" == "Darwin" ]; then
    echo "Darwin not supported"
    exit 1
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    echo "MINGW32_NT not supported"
    exit 1
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    VINTNER="${ASSETS}/vintner-win-x64.exe"
fi

VINTNER_XZ="${VINTNER}.xz"

if [ ! -f "${VINTNER}" ]; then
    tar -xf "${VINTNER_XZ}" -C "${ASSETS}"
fi

# use local vintner
#VINTNER="./../opentosca-vintner/task vintner"

echo
echo "using ${VINTNER}"

${VINTNER} ${@}
