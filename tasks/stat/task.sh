#!/usr/bin/bash
set -e

echo "-------------------------"
S=0
for TEMPLATE in dirbyh hybrid physical virtual
do
    T=$(wc -l < "${TASK_ROOT_DIR}/templates/testing/mcms-${TEMPLATE}/template.yaml")
    echo "${TEMPLATE}: ${T}"
    S=$((S + T))
done

echo "-------------------------"
echo "sum: ${S}"
echo "-------------------------"

V=$(wc -l < "${TASK_ROOT_DIR}/templates/testing/mcms-variability/template.yaml")
echo "variability: ${V}"
echo "-------------------------"

R=$(bc <<<"scale=2; $V / $S")
echo "variability/sum: ${R}"
echo "-------------------------"
