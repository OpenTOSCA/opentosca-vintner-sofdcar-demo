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
  echo "Pulling ${TEMPLATE} (link: ${LINK})"
  if [[ "${LINK}" == true ]]; then
    ${TASK_BIN} vintner template pull --dir "$(realpath ${TEMPLATE})"  --link
  else
    ${TASK_BIN} vintner template pull --dir "$(realpath ${TEMPLATE})"
  fi

done
