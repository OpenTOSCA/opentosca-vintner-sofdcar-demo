has_error=0

echo
echo "Merged Scenario"
${TASK_BIN} vintner template test --path "${TASK_ROOT_DIR}/templates/merged/mcms-variability" || has_error=1

echo
echo "Premium Scenario"
${TASK_BIN} vintner template test --path "${TASK_ROOT_DIR}/templates/premium/mcms-variability" || has_error=1

echo
echo "Premium Remote Scenario"
${TASK_BIN} vintner template test --path "${TASK_ROOT_DIR}/templates/premium/mcms-variability-remote" || has_error=1

echo
echo "Testing Scenario"
${TASK_BIN} vintner template test --path "${TASK_ROOT_DIR}/templates/testing/mcms-variability" || has_error=1


# Check if any test failed
if [[ $has_error -eq 1 ]]; then
    exit 1
fi
