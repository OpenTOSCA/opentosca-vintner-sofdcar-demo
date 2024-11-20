# Symbolic
LINK=${1:-false}

# Pull dependencies of each template
for TEMPLATE in templates/*/*/; do

  # Ignore directories starting with a dot
  if [[  "${TEMPLATE}" == "\."* ]]; then
    continue
  fi

  # Ignore directories without config.yaml
  if [ ! -f "${TEMPLATE}/config.yaml" ]; then
    continue
  fi

  # Pull dependencies
  echo "Unpulling ${TEMPLATE}"
  ${TASK_BIN} vintner template unpull --dir "$(realpath ${TEMPLATE})"
done
