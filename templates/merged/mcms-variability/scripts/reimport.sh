#! /usr/bin/bash
set -e

# Load configuration
source configuration.sh

$VINTNER instances undeploy --instance ${TEMPLATE_NAME}
$VINTNER instances delete --instance ${TEMPLATE_NAME}
$VINTNER templates delete --template ${TEMPLATE_NAME}

$VINTNER templates import --template ${TEMPLATE_NAME}  --path ${TEMPLATE_DIR}
$VINTNER instances init --instance ${TEMPLATE_NAME}  --template ${TEMPLATE_NAME}
$VINTNER instances resolve --instance ${TEMPLATE_NAME} --inputs ${TEMPLATE_DIR}/tests/${DEPLOYMENT_VARIANT}/inputs.yaml
$VINTNER instances validate --instance ${TEMPLATE_NAME}  --inputs ${TEMPLATE_DIR}/deployment-inputs.ignored.yaml
$VINTNER instances deploy --instance ${TEMPLATE_NAME}  --inputs ${TEMPLATE_DIR}/deployment-inputs.ignored.yaml
